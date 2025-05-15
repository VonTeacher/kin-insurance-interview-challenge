# Implements methods to scan, read, validate, and parse OCR-related information
module PolicyOcr
  class << self
    # Returns the numeric character corresponding to an OCR digit.
    #
    # Looks up the given digit pattern in the OcrDigit::MAPPING and returns the
    # corresponding string digit. If the digit is not recognized, returns "?".
    #
    # === Parameters
    # [digit (String)] A single OCR digit to scan.
    #
    # === Returns
    # String - The recognized digit (e.g., "0"–"9") or "?" if unknown.
    def scan_number(digit:)
      raise ArgumentError, "You must provide a digit to scan!" if digit.nil?

      OcrDigits::MAPPING.fetch(digit, "?")
    end

    # Returns the string of characters corresponding to an OCR string.
    #
    # Digests an 81 character string patter and returns the corresponding
    # string value.
    #
    # === Parameters
    # [digits (String)] The OCR digit pattern to scan (e.g., a multi-line string).
    #
    # === Returns
    # String - The recognized nine digit value.
    def read_digits(digits:)
      col = 0
      result = ""

      while col < 27 # We can consider an OCR string as a 3x27 grid, so we set that column limit
        row = 0
        digit = ""

        while row < 3
          leftmost = row * 27 + col # Use row to calculate our index and move use col to move us "right"
          digit += digits[(leftmost)..(leftmost + 2)]
          row += 1
        end
        col += 3
        result += self.scan_number(digit:)
      end

      result
    end

    # Returns a list of string values from a file of OCR strings.
    #
    # Takes a file containing OCR strings and adds them to an output array, using an optional
    # parameter to append a parsed value status.
    #
    # === Parameters
    # [file (File)] The file containing OCR strings.
    # [include_status (Boolean) optional] Flag to include parsed value status.
    def parse_file(file:, include_status: false)
      output = []

      begin
        lines =  File.readlines(file, chomp: true)
      rescue Errno::ENOENT => e
        return []
      rescue => e
        return []
      end

      lines.each_slice(4) do |digits| # We know OCR values are three lines separated by a blank one
        data_lines = digits.take(3)

        if data_lines.size < 3
          # Report to Rollbar, etc. and skip, as the OCR is likely majorly malformed
          next
        end

        combined = data_lines.join

        number = read_digits(digits: combined)
        status = append_status(number: number) if include_status

        output << "#{number} #{status}".strip
      end

      # if include_status
      #   File.open("findings.txt", "w").do |file|
      #     output.each { |line| file.puts(line) }
      #   end
      # end

      output
    end

    # Validates a policy number using a checksum algorithm.
    #
    # Each digit is multiplied by a decreasing weight starting from 9, and the
    # results are summed. The policy number is considered valid if the total is
    # divisible by 11.
    #
    # === Parameters
    # [number (String)] The policy number to validate. Must be a string of digits.
    #
    # === Returns
    # Boolean - true if the number is valid, false otherwise.
    def validate_policy_number(number:)
      return false if number.nil? || number.empty? || number.length != 9
      return false if number.index("?")

      multiplier = 9
      total = 0

      number.split("").each_with_index do |digit, index|
        total += digit.to_i * (multiplier - index)
      end

      (total % 11).zero?
    end

    private

    # Not the biggest fan of this method, but we only have two non-valid cases, so it works for now.
    # Would definitely consider a different means handling this as cases increase or as reporting needs advanced.
    def append_status(number:)
      if number.index("?")
        "ILL"
      elsif validate_policy_number(number:) # Calling public method from private
        ""
      else
        "ERR"
      end
    end
  end
end

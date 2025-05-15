module PolicyOcr
  class << self
    def scan_number(digit:)
      OcrDigits::MAPPING.fetch(digit, "?")
    end

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

    def parse_file(file:, include_status: false)
      output = []
      lines =  File.readlines(file, chomp: true) # chomp to remove newlines

      lines.each_slice(4) do |digits|
        data_lines = digits.take(3)
        combined = data_lines.join
        
        number = read_digits(digits: combined)
        status = append_status(number:) if include_status
        
        output << "#{number} #{status}".strip
      end

      output
    end

    def validate_policy_number(number:)
      multiplier = 9
      total = 0

      number.split("").each_with_index do |digit, index|
        total += digit.to_i * (multiplier - index)
      end

      (total % 11).zero?
    end
    
    private
    
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

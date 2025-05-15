module PolicyOcr
  class << self
    def scan_number(digit:)
      OcrDigits::MAPPING.fetch(digit, "?")
    end

    def read_digits(digits:)
      col = 0
      result = ""
      # while our result is less than 9 chars in length
      # take 3x3 blocks from the left, parse and send to scan_number
      # assemble and return the resulting string
      # "     |  |" for "1", etc
      while col < 27
        row = 0
        digit = ""
        while row < 3
          leftmost = row * 27 + col
          digit += digits[(leftmost)..(leftmost + 2)]
          row += 1
        end
        col += 3
        result += self.scan_number(digit: digit)
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
        status = append_status(number: number) if include_status
        
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
      elsif validate_policy_number(number: number)
        ""
      else
        "ERR"
      end
    end
  end
end

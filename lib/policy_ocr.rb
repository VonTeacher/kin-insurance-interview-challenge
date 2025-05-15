module PolicyOcr
  class << self
    def scan_number(digit:)
      OcrDigits::MAPPING[digit]
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
  end
end

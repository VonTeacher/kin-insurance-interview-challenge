module PolicyOcr
  class << self
    def scan_number(digits:)
      if digits == OcrDigits.zero
        "0"
      elsif digits == OcrDigits.one
        "1"
      elsif digits == OcrDigits.two
        "2"
      elsif digits == OcrDigits.three
        "3"
      elsif digits == OcrDigits.four
        "4"
      elsif digits == OcrDigits.five
        "5"
      elsif digits == OcrDigits.six
        "6"
      elsif digits == OcrDigits.seven
        "7"
      elsif digits == OcrDigits.eight
        "8"
      elsif digits == OcrDigits.nine
        "9"
      end
    end
  end
end

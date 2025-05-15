module PolicyOcr
  class << self
    def scan_number(digits:)
      if digits == OcrDigits.zero
        "0"
      elsif digits == OcrDigits.one
        "1"
      end
    end
  end
end

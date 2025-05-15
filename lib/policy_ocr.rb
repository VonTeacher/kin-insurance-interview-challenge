module PolicyOcr
  class << self
    def scan_number(digits:)
      OcrDigits::MAPPING[digits]
    end
  end
end

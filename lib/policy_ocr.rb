module PolicyOcr
  class << self
    def scan_number(digits:)
      if digits == zero
        "0"
      end
    end

    private

    def zero
      zero =  " _ "
      zero += "| |"
      zero += "|_|"
      zero
    end
  end
end

module PolicyOcr
  class << self
    def scan_number(digits:)
      if digits == zero
        "0"
      elsif digits == one
        "1"
      end
    end

    private

    def zero
      zero =  " _ "
      zero += "| |"
      zero += "|_|"
    end

    def one
      one =  "   "
      one += "  |"
      one += "  |"
    end
  end
end

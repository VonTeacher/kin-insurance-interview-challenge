module OcrDigits
  class << self
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

    def two
      two =  " _ "
      two += " _|"
      two += "|_ "
    end

    def three
      three =  " _ "
      three += " _|"
      three += " _|"
    end

    def four
      four =  "   "
      four += "|_|"
      four += "  |"
    end

    def five
      five =  " _ "
      five += "|_ "
      five += " _|"
    end

    def six
      six =  " _ "
      six += "|_ "
      six += "|_|"
    end

    def seven
      seven =  " _ "
      seven += "  |"
      seven += "  |"
    end

    def eight
      eight =  " _ "
      eight += "|_|"
      eight += "|_|"
    end

    def nine
      nine =  " _ "
      nine += "|_|"
      nine += " _|"
    end
  end
end

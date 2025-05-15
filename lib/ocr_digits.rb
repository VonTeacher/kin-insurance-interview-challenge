# Provides wrapper methods and mapping hash for OCR character lookup
module OcrDigits
  class << self
    def zero
      " _ " +
      "| |" +
      "|_|"
    end

    def one
      "   " +
      "  |" +
      "  |"
    end

    def two
      " _ " +
      " _|" +
      "|_ "
    end

    def three
      " _ " +
      " _|" +
      " _|"
    end

    def four
      "   " +
      "|_|" +
      "  |"
    end

    def five
      " _ " +
      "|_ " +
      " _|"
    end

    def six
      " _ " +
      "|_ " +
      "|_|"
    end

    def seven
      " _ " +
      "  |" +
      "  |"
    end

    def eight
      " _ " +
      "|_|" +
      "|_|"
    end

    def nine
      " _ " +
      "|_|" +
      " _|"
    end
  end

  MAPPING = {
    zero  => "0",
    one   => "1",
    two   => "2",
    three => "3",
    four  => "4",
    five  => "5",
    six   => "6",
    seven => "7",
    eight => "8",
    nine  => "9"
  }
end

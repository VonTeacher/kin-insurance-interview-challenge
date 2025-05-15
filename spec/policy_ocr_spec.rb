require_relative '../lib/policy_ocr'
require_relative '../lib/ocr_digits'

describe PolicyOcr do
  it "loads" do
    expect(PolicyOcr).to be_a Module
  end

  it 'loads the sample.txt' do
    expect(fixture('sample').lines.count).to eq(44)
  end

  describe ".scan_number" do
    context "when single digit" do
      context "when zero" do
        let(:digit) { OcrDigits.zero }

        it "scans a zero" do
          expect(described_class.scan_number(digit: digit)).to eq "0"
        end
      end

      context "when one" do
        let(:digit) { OcrDigits.one }

        it "scans a one" do
          expect(described_class.scan_number(digit: digit)).to eq "1"
        end
      end

      context "when two" do
        let(:digit) { OcrDigits.two }

        it "scans a two" do
          expect(described_class.scan_number(digit: digit)).to eq "2"
        end
      end

      context "when three" do
        let(:digit) { OcrDigits.three }

        it "scans a three" do
          expect(described_class.scan_number(digit: digit)).to eq "3"
        end
      end

      context "when four" do
        let(:digit) { OcrDigits.four }

        it "scans a four" do
          expect(described_class.scan_number(digit: digit)).to eq "4"
        end
      end

      context "when five" do
        let(:digit) { OcrDigits.five }

        it "scans a five" do
          expect(described_class.scan_number(digit: digit)).to eq "5"
        end
      end

      context "when six" do
        let(:digit) { OcrDigits.six }

        it "scans a six" do
          expect(described_class.scan_number(digit: digit)).to eq "6"
        end
      end

      context "when seven" do
        let(:digit) { OcrDigits.seven }

        it "scans a seven" do
          expect(described_class.scan_number(digit: digit)).to eq "7"
        end
      end

      context "when eight" do
        let(:digit) { OcrDigits.eight }

        it "scans a eight" do
          expect(described_class.scan_number(digit: digit)).to eq "8"
        end
      end

      context "when nine" do
        let(:digit) { OcrDigits.nine }

        it "scans a nine" do
          expect(described_class.scan_number(digit: digit)).to eq "9"
        end
      end
    end
  end

  describe ".read_digits" do
    it "scans 123456789" do
      digits = "    _  _     _  _  _  _  _ " +
               "  | _| _||_||_ |_   ||_||_|" +
               "  ||_  _|  | _||_|  ||_| _|"
      expect(described_class.read_digits(digits: digits)).to eq "123456789"
    end

    it "scans 000000000" do
      digits = " _  _  _  _  _  _  _  _  _ " +
               "| || || || || || || || || |" +
               "|_||_||_||_||_||_||_||_||_|"
      expect(described_class.read_digits(digits: digits)).to eq "000000000"
    end

    it "scans 111111111" do
      digits = "                           " +
               "  |  |  |  |  |  |  |  |  |" +
               "  |  |  |  |  |  |  |  |  |"
      expect(described_class.read_digits(digits: digits)).to eq "111111111"
    end
  end
end

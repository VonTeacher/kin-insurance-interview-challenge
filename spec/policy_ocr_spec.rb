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
    context "when zero" do
      let(:digits) { OcrDigits.zero }

      it "scans a zero" do
        expect(described_class.scan_number(digits: digits)).to eq "0"
      end
    end

    context "when one" do
      let(:digits) { OcrDigits.one }

      it "scans a one" do
        expect(described_class.scan_number(digits: digits)).to eq "1"
      end
    end

    context "when two" do
      let(:digits) { OcrDigits.two }

      it "scans a two" do
        expect(described_class.scan_number(digits: digits)).to eq "2"
      end
    end

    context "when three" do
      let(:digits) { OcrDigits.three }

      it "scans a three" do
        expect(described_class.scan_number(digits: digits)).to eq "3"
      end
    end

    context "when four" do
      let(:digits) { OcrDigits.four }

      it "scans a four" do
        expect(described_class.scan_number(digits: digits)).to eq "4"
      end
    end

    context "when five" do
      let(:digits) { OcrDigits.five }

      it "scans a five" do
        expect(described_class.scan_number(digits: digits)).to eq "5"
      end
    end

    context "when six" do
      let(:digits) { OcrDigits.six }

      it "scans a six" do
        expect(described_class.scan_number(digits: digits)).to eq "6"
      end
    end

    context "when seven" do
      let(:digits) { OcrDigits.seven }

      it "scans a seven" do
        expect(described_class.scan_number(digits: digits)).to eq "7"
      end
    end

    context "when eight" do
      let(:digits) { OcrDigits.eight }

      it "scans a eight" do
        expect(described_class.scan_number(digits: digits)).to eq "8"
      end
    end

    context "when nine" do
      let(:digits) { OcrDigits.nine }

      it "scans a nine" do
        expect(described_class.scan_number(digits: digits)).to eq "9"
      end
    end
  end
end

#    _  _     _  _  _  _  _   | _| _||_||_ |_   ||_||_|  ||_  _|  | _||_|  ||_| _|
# consider as 2d array
#    _  _     _  _  _  _  _
#  | _| _||_||_ |_   ||_||_|
#  ||_  _|  | _||_|  ||_| _|
# empty line here
# policy number length: 9 digits
# top three lines contain number info
# fourth line is blank

# scan the pipes number
# return the actual number
# Input: <see above>
# Output: "123456789"
# param: digits (string)

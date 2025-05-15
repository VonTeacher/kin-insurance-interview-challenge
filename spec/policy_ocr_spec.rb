require_relative '../lib/policy_ocr'

describe PolicyOcr do
  it "loads" do
    expect(PolicyOcr).to be_a Module
  end

  it 'loads the sample.txt' do
    expect(fixture('sample').lines.count).to eq(44)
  end

  describe ".scan_number" do
    context "when zero" do
      let(:digits) { " _ | ||_|" }

      it "scans a zero" do
        expect(described_class.scan_number(digits: digits)).to eq "0"
      end
    end

    context "when one" do
      let(:digits) { "     |  |" }

      it "scans a one" do
        expect(described_class.scan_number(digits: digits)).to eq "1"
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

describe ISBN13 do
  describe ".calculate" do

    let(:calculate) { ->(input) { described_class.calculate(input) } }

    it "978014300723 must returns 9780143007234" do
      expect(calculate.call("978014300723")).to eq "9780143007234"
    end

    describe "raises ISBN13::InvalidNumberFormat" do
      it "when a number is not given" do
        expect{ calculate.call("AAAAAAAAAAAAA") }.
          to raise_error(ISBN13::InvalidNumberFormat, "only numbers must be given")
      end

      it "when a number is not given" do
        expect{ calculate.call("11111111111") }.
          to raise_error(ISBN13::InvalidNumberFormat, "incorrect length")
      end
    end
  end
end

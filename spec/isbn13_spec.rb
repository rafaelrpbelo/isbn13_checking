describe ISBN13 do
  describe ".check" do
    it "978014300723 must returns 9780143007234" do
      result = described_class.check("978014300723")

      expect(result).to eq "9780143007234"
    end

    describe "raises ISBN13::InvalidNumberFormat" do
      it "when a number is not given" do
        expect{ described_class.check("AAAAAAAAAAAAA") }.
          to raise_error(ISBN13::InvalidNumberFormat, "only numbers must be given")
      end

      it "when a number is not given" do
        expect{ described_class.check("11111111111") }.
          to raise_error(ISBN13::InvalidNumberFormat, "incorrect length")
      end
    end
  end
end

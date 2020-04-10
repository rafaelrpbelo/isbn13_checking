describe ISBN13 do
  describe ".check" do
    it "978014300723 must returns 9780143007234" do
      result = described_class.check("978014300723")

      expect(result).to eq "9780143007234"
    end
  end
end

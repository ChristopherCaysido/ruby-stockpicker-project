#spec/stockpicker_spec.rb
require './lib/stockpicker'

describe "Stockpicker" do
  describe "#stockpicker" do
    it "returns a array pair of values that is the best in " do
      expect(stockpicker([17,3,6,9,15,8,6,1,10])).to eql([1,4])
    end

    it "returns a pair when the lowest is on the last day"
      expect(stockpicker([17,9,15,8,6,10,3])).to eql([6,10])
  end
end
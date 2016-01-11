require "./lib/bike.rb"

describe Bike do
  subject(:bike) {described_class.new}

  describe "#working" do
    it "allows me to see if a bike is working" do
      expect(bike.working).to be(true)
    end
  end
end

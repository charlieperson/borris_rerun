require "./lib/van.rb"

describe Van do
  subject(:van) {described_class.new}
  let(:bike) { double :bike }
  let(:station) { double :station }

  it "allows vans to pick up broken bikes" do
    allow(bike).to receive(:working).and_return(false)
    allow(station).to receive(:bikes).and_return([bike])
    van.pick_up(station)
    expect(van.inventory).to include(bike)
  end
end

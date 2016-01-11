require './lib/docking_station.rb'

describe DockingStation do

    subject(:station) {described_class.new}

  it "can release a bike" do
    expect(station).to respond_to(:release_bike)
  end
end

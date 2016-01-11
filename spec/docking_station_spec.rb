require './lib/docking_station.rb'

describe DockingStation do

    subject(:station) {described_class.new}
    let(:bike) { double :bike }

  it "allows a user to get a bike from a docking station" do
    station.dock(bike)
    expect{station.release_bike}.to_not raise_error
  end

  it "can release a bike" do
    expect(station).to respond_to(:release_bike)
  end

  it "allows a bike to be docked" do
    expect(station).to respond_to(:dock)
  end

  it "allows users to see bikes in the station" do
    station.dock(bike)
    expect(station.bikes).to include(bike)
  end

  it "raise an error if some bitchass tries to release some bike when there aint none available" do
    expect { station.release_bike }.to raise_error("Soorry maiite, there's no bikes available!")
  end
end

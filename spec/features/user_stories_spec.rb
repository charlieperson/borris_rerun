require './lib/docking_station.rb'

describe "User Stories" do

  subject(:station) {DockingStation.new}
  subject(:bike) {Bike.new}
  # As a person,
  # So that I can use a bike,
  # I'd like to get a bike from a docking station.
  it "allows a user to get a bike from a docking station" do
    station.dock(bike)
    expect{station.release_bike}.to_not raise_error
  end

  # As a person,
  # So that I can use a good bike,
  # I'd like to see if a bike is working
  it "allows me to see if a bike is working" do
    expect(bike.working).to be(true)
  end

  # As a member of the public
  # So I can return bikes I've hired
  # I want to dock my bike at the docking station
  it "allows a bike to be docked" do
    expect(station).to respond_to(:dock)
  end

  # As a member of the public
  # So I can decide whether to use the docking station
  # I want to see a bike that has been docked
  it "allows users to see bikes in the station" do
    station.dock(bike)
    expect(station.bikes).to include(bike)
  end

  # As a member of the public,
  # So that I am not confused and charged unnecessarily,
  # I'd like docking stations not to release bikes when there are none available.
  it "raise an error if some bitchass tries to release some bike when there aint none available" do
    expect { station.release_bike }.to raise_error("Soorry maiite, there's no bikes available!")
  end

end

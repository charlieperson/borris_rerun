require './lib/docking_station.rb'

describe "User Stories" do

  subject(:station) {DockingStation.new}
  # As a person,
  # So that I can use a bike,
  # I'd like to get a bike from a docking station.
  it "allows a user to get a bike from a docking station" do
    station.release_bike
    expect(station.bike.working).to be(true)
  end

  # As a person,
  # So that I can use a good bike,
  # I'd like to see if a bike is working
  # it "allows me to see if a bike is working" do
  #   station.release_bike
  #   expect(station.bike).to_be(:working?)
  # end
end

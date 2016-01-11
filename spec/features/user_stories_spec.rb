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

  # As a maintainer of the system,
  # So that I can control the distribution of bikes,
  # I'd like docking stations not to accept more bikes than their capacity.
  it "raise an error if the docking station is at full capacity" do
    DEFAULT_CAPACITY.times { station.dock(bike) }
    expect { station.dock(bike) }.to raise_error("Cannot dock, station at full capacity")
  end

  # As a system maintainer,
  # So that I can plan the distribution of bikes,
  # I want a docking station to have a default capacity of 20 bikes.
  it "has a default capacity of 20 bikes" do
    DEFAULT_CAPACITY.times { station.dock(bike) }
    expect { station.dock(bike) }.to raise_error("Cannot dock, station at full capacity")
  end

  # As a system maintainer,
  # So that busy areas can be served more effectively,
  # I want to be able to specify a larger capacity when necessary.

  # As a maintainer of the system,
  # So that I can manage broken bikes and not disappoint users,
  # I'd like vans to take broken bikes from docking stations and deliver them to garages to be fixed.
  #
  # As a maintainer of the system,
  # So that I can manage broken bikes and not disappoint users,
  # I'd like vans to collect working bikes from garages and distribute them to docking stations.


  #
  # ​[11:56]
  # As a member of the public,
  # So that I reduce the chance of getting a broken bike in future,
  # I'd like to report a bike as broken when I return it.
  #
  # As a maintainer of the system,
  # So that I can manage broken bikes and not disappoint users,
  # I'd like docking stations not to release broken bikes.
  #
  # As a maintainer of the system,
  # So that I can manage broken bikes and not disappoint users,
  # I'd like docking stations to accept returning bikes (broken or not).
end

require_relative "bike.rb"

DEFAULT_CAPACITY = 20

class DockingStation

  attr_reader :bike, :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    bikes.empty? ? raise("Soorry maiite, there's no bikes available!") : bikes.pop
  end

  def dock(bike)
    bikes.length < DEFAULT_CAPACITY ? @bikes << bike : raise("Cannot dock, station at full capacity")
  end

end

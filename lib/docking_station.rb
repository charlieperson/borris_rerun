require_relative "bike.rb"

class DockingStation

  attr_reader :bike, :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    bikes.empty? ? raise("Soorry maiite, there's no bikes available!") : bike
  end

  def dock(bike)
    @bikes << bike
  end
  
end

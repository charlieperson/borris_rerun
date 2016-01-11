require_relative "bike.rb"

DEFAULT_CAPACITY = 20

class DockingStation

  attr_reader :bikes

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def release_bike
    if bikes.empty?
      raise("Sorry mate, no bikes available!")
    elsif bikes.last.working == false
      raise("Sorry mate this bike is broken")
    else
      bikes.pop
    end
  end

  def dock(bike)
    full? ?  raise("Cannot dock, station at full capacity") : @bikes << bike
  end

  def dock_and_report(bike)
    if full?
      raise("Cannot dock, station at full capacity")
    else
      bike.working = false
      @bikes.unshift(bike)
    end
  end

  private

  def full?
    bikes.length >= @capacity
  end

end

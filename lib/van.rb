require_relative "docking_station.rb"

class Van
  attr_reader :inventory
  def initialize
    @inventory = []
  end

  def pick_up(station)
    station.bikes.each {|bike| @inventory << bike if bike.working == false}
  end
end

require './lib/docking_station.rb'

describe DockingStation do

    subject(:station) {described_class.new}
    let(:bike) { double :bike }

  describe "#dock" do
    it "allows a user to get a bike from a docking station" do
      subject.dock(bike)
      expect{subject.release_bike}.to_not raise_error
    end

    it "allows a bike to be docked" do
      expect(subject).to respond_to(:dock)
    end

    it "has a default capacity of 20 bikes" do
      DEFAULT_CAPACITY.times { subject.dock(bike) }
      expect{ subject.dock(bike) }.to raise_error("Cannot dock, station at full capacity")
    end
  end

  describe "#release_bike" do
    it "can release a bike" do
      expect(subject).to respond_to(:release_bike)
    end

    it "raise an error if some bitchass tries to release some bike when there aint none available" do
      expect { subject.release_bike }.to raise_error("Soorry maiite, there's no bikes available!")
    end
  end

  describe "#bikes" do
    it "allows users to see bikes in the station" do
      subject.dock(bike)
      expect(subject.bikes).to include(bike)
    end
  end
end

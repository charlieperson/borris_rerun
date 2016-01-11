require './lib/docking_station.rb'

describe DockingStation do

    subject(:station) {described_class.new}
    let(:bike) { double :bike }

  describe "#dock" do
    it "allows a user to get a bike from a docking station" do
      allow(bike).to receive(:working)
      subject.dock(bike)
      expect{subject.release_bike}.to_not raise_error
    end

    it "allows a bike to be docked" do
      expect(subject).to respond_to(:dock)
    end

    it "accepts working or broken bikes" do
      allow(bike).to receive(:working=).and_return(false)
      expect{ station.dock(bike) }.to_not raise_error
    end
  end

  it "has a default capacity of bikes" do
    DEFAULT_CAPACITY.times { subject.dock(bike) }
    expect{ subject.dock(bike) }.to raise_error("Cannot dock, station at full capacity")
  end

  it "allows me to pass in a customized capacity as needed" do
    station = DockingStation.new(40)
    expect{40.times{station.dock(bike)}}.to_not raise_error
  end

  describe "#release_bike" do
    it "can release a bike" do
      expect(subject).to respond_to(:release_bike)
    end

    it "raise an error if some bitchass tries to release some bike when there aint none available" do
      expect { subject.release_bike }.to raise_error("Sorry mate, no bikes available!")
    end

    it "does not release broken bikes" do
      allow(bike).to receive(:working).and_return(false)
      allow(bike).to receive(:working=)
      station.dock_and_report(bike)
      expect{ station.release_bike }.to raise_error("Sorry mate this bike is broken")
    end
  end

  describe "#bikes" do
    it "allows users to see bikes in the station" do
      subject.dock(bike)
      expect(subject.bikes).to include(bike)
    end
  end

  describe "#dock_and_report" do
    it "allows me to report a bike as broken upon docking it" do
      allow(bike).to receive(:working=)
      station.dock_and_report(bike)
      expect(station.bikes).to include(bike)
    end
  end
end

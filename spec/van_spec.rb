require_relative './spec_helper'

describe Van do

  def fill_van van
    20.times { van.load(Bike.new) }
  end

  let(:van) { Van.new({capacity: 20}) }
  let(:station) { DockingStation.new({capacity: 20}) }
  let(:bike) { Bike.new }
  let(:garage) { Garage.new({capacity: 20}) }

  it 'should be empty when made' do
    expect(van.bike_count).to eq 0
  end

  it 'should be able to load a bike' do
    van.load(bike)
    
    expect(van.bike_count).to eq 1
  end

  it 'should be able to release a bike' do
    van.load(bike)
    van.unload(bike)

    expect(van.bike_count).to eq 0
  end

  it 'should not accept a bike if the van is full' do
    fill_van van

    expect{van.load(bike)}.to raise_error 'Van is full'
  end

  it 'should provide a list of broken bikes in the station' do
    working_bike, broken_bike = Bike.new, Bike.new
    working_bike.break
    station.dock(working_bike)
    station.dock(broken_bike)

    expect(station.available_bikes).to eq [broken_bike]
  end


  it 'station @bike aray should decrease as bike is moved to van' do
    station.dock(bike)
    van.bike_station_to_van(bike, station)

    expect(station.bike_count).to eq 0
  end

  it 'van @bike aray should incrament as bike is moved to van' do
    station.dock(bike)
    van.bike_station_to_van(bike, station)

    expect(van.bike_count).to eq 1
  end

  it 'van @bike aray should decrease as bike is moved to garage' do
    van.load(bike)
    van.bike_van_to_garage(bike, garage)

    expect(van.bike_count).to eq 0
  end
  
end
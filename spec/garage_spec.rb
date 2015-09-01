require_relative './spec_helper'

describe Garage do

  let(:van) { Van.new({capacity: 20}) }
  let(:garage) { Garage.new({capacity: 20}) }
  let(:station) { DockingStation.new({capacity: 20}) }
  let(:bike) { Bike.new }


  it 'should be empty after we build it' do
    expect(garage.bike_count).to eq 0
  end

  it 'should be able to admit a bike' do
    garage.admit(bike)
    
    expect(garage.bike_count).to eq 1
  end

  it 'should be able to release a bike' do
    garage.admit(bike)
    garage.release(bike)
    
    expect(garage.bike_count).to eq 0
  end





end

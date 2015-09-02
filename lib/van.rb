class Van

  DEFAULT_CAPACITY = 5
  def initialize options = {}

    @capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
    @bikes = []
  end

  def bike_count
    @bikes.count
  end

  def load bike
    raise 'Van is full' if full?
  @bikes << bike
  end

  def unload bike
    @bikes.delete bike
  end

  def full?
    bike_count == @capacity
  end

  def available_bikes
    @bikes.reject { |bike| bike.working? }
  end

#removed bike from station bike array and inserts into van bikes array   
  def bike_station_to_van (bike, station)
    station.release(bike)
    self.load(bike)
  end

#admit a bike to garage from van  
  def bike_van_to_garage (bike, garage)
    self.unload(bike)
    garage.admit(bike)
  end

end

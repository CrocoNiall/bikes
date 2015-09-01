class Garage

  DEFAULT_CAPACITY = 5
  def initialize options = {}

    @capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
    @bikes = []
  end

  def bike_count
    @bikes.count
  end

  def admit bike
  @bikes << bike
  end

  def release bike
    @bikes.delete bike
  end




end

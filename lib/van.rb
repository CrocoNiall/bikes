class Van

  DEFAULT_CAPACITY = 5
  def initialize options = {}

    @capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
    @bikes = []
  end

end

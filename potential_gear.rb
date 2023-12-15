class PotentialGear
  attr_reader :index, :adjacent_numbers

  def initialize(index)
    @index = index
    @adjacent_numbers = []
  end

  def neighbourhood_boundries
    index - 1..index + 1
  end

  def add_adjacent_numbers(numbers)
    @adjacent_numbers += numbers
  end

  def ratio
    adjacent_numbers.reduce(:*)
  end
end

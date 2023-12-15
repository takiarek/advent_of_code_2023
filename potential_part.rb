class PotentialPart
  attr_reader :number, :start_index

  def initialize(number, start_index)
    @number, @start_index = number, start_index
  end

  def neighbourhood_boundries
    neighbourhood_start..neighbourhood_finish
  end

  def index_range
    start_index..end_index
  end

  private

  def neighbourhood_start
    [start_index - 1, 0].max
  end

  def neighbourhood_finish
    end_index + 1
  end

  def end_index
    start_index + number.length - 1
  end
end

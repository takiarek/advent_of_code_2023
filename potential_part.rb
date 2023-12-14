class PotentialPart
  attr_reader :number, :start_index

  def initialize(line, number, start_index)
    @line, @number, @start_index = line, number, start_index
  end

  def neighbourhood_boundries
    neighbourhood_start..neighbourhood_finish
  end

  private

  def neighbourhood_start
    [start_index - 1, 0].max
  end

  def neighbourhood_finish
    end_index + 1
  end

  def end_index
    line.value.index(number) + number.length - 1
  end

  private

  attr_reader :line
end

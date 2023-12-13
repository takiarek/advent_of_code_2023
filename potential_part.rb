class PotentialPart
  attr_reader :number

  def initialize(line, number)
    @line, @number = line, number
  end

  def to_h
    {
      number: number,
      start_index: start_index,
      end_index: end_index
    }
  end

  def start_index
    line.value.index(number)
  end

  def end_index
    line.value.index(number) + number.length - 1
  end

  private

  attr_reader :line
end

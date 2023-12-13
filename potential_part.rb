class PotentialPart
  attr_reader :number

  def initialize(line, number)
    @line, @number = line, number
  end

  def start_index
    line.value.index(number)
  end

  private

  attr_reader :line
end

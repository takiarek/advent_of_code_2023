require_relative "potential_part"

class Line
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def potential_parts
    numbers.map { |number| PotentialPart.new(self, number) }
  end

  private

  def numbers
    value.scan(/\d*/).reject(&:empty?)
  end
end

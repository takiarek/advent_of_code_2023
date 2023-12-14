require_relative "potential_part"

class Line
  attr_reader :value

  def initialize(value)
    @value = value.strip
  end

  def potential_parts
    numbers.map do |number|
      PotentialPart.new(number, start_index(number))
    end
  end

  def adjacent_symbols_to?(potential_part)
    value[potential_part.neighbourhood_boundries].split.any? { |char| char.match?(/[^.^\d\s]/) }
  end

  private

  def numbers
    value.scan(/\d*/).reject(&:empty?)
  end

  def start_index(number)
    value.index(number)
  end
end

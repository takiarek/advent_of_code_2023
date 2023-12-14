require_relative "potential_part"

class Line
  attr_reader :value

  def initialize(value)
    @value = value.strip
  end

  def potential_parts
    string = value

    numbers.map do |number|
      start_index = string.index(number)

      string.sub!(number, "." * number.size)

      PotentialPart.new(number, start_index)
    end
  end

  def adjacent_symbols_to?(potential_part)
    value[potential_part.neighbourhood_boundries].split.any? { |char| char.match?(/[^.^\d\s]/) }
  end

  private

  def numbers
    value.scan(/\d*/).reject(&:empty?)
  end
end

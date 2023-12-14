require "json"
require "debug"

require_relative "line"

class EngineSchematic
  def initialize(input: "../inputs/3/input.txt")
    @lines = File.readlines(input)
  end

  def parts_sum
    real_parts.sum do |part|
      part.number.to_i
    end
  end

  private

  def lines
    @lines.map { |line| Line.new(line) }
  end

  def real_parts
    lines.flat_map.with_index do |line, line_index|
      line_real_parts(line, line_index)
    end
  end

  def line_real_parts(line, line_index)
    line.potential_parts.select do |part|
      neighbourhood_lines(line, line_index).any? do |neighbourhood_line|
        neighbourhood_line.adjacent_symbols_to?(part)
      end
    end
  end

  def neighbourhood_lines(line, line_index)
    start = [line_index - 1, 0].max
    finish = [line_index + 1, lines.length - 1].min

    lines[start..finish]
  end
end

puts EngineSchematic.new.parts_sum

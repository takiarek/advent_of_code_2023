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
    lines.map.with_index do |current_line, line_index|
      current_line.potential_parts.select do |part|
        neighbourhood_lines(current_line, line_index).any? do |line|
          adjacent_symbols?(part, line)
        end
      end
    end.flatten
  end

  def neighbourhood_lines(line, line_index)
    start = [line_index - 1, 0].max
    finish = [line_index + 1, lines.length - 1].min

    lines[start..finish]
  end

  def adjacent_symbols?(potential_part, line)
    line.value[potential_part.neighbourhood].split.any? { |char| symbol?(char) }
  end

  def symbol?(character)
    character.match?(/[^.^\d\s]/)
  end
end

# puts EngineSchematic.new.parts_sum

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
        next true if symbol?(current_line.value[part.start_index - 1]) || symbol?(current_line.value[part.end_index + 1])

        other_lines = case line_index
        when 0
          [1]
        when lines.length - 1
          [-1]
        else
          [-1, 1]
        end

        other_lines.any? do |other_line|
          line = lines[line_index + other_line].value

          start = [part.start_index - 1, 0].max
          finish = [part.end_index + 1, line.length - 1].min

          line[start..finish].split.any? { |char| symbol?(char) }
        end
      end
    end.flatten
  end

  def symbol?(character)
    character.match?(/[^.^\d\s]/)
  end
end

# puts EngineSchematic.new.parts_sum

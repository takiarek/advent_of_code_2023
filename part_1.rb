require "json"
require "debug"

require_relative "line"

class EngineSchematic
  def initialize(input: "../inputs/3/input.txt")
    @lines = File.readlines(input)
  end

  def parts_sum
    lines_with_potential_parts = find_potential_parts

    real_parts = find_real_parts(lines_with_potential_parts)

    real_parts.sum do |part|
      part[:number].to_i
    end
  end

  private

  def lines
    @lines.map { |line| Line.new(line) }
  end

  def find_potential_parts
    lines_of_numbers.each_with_object({}) do |(line_index, numbers), hash|
      hash[line_index] = numbers.map do |number|
        {
          number: number,
          start_index: lines[line_index].value.index(number),
          end_index: lines[line_index].value.index(number) + number.length - 1
        }
      end
    end
  end

  def lines_of_numbers
    lines_numbers.each_with_object({}).with_index do |(numbers, hash), index|
      next if numbers.empty?

      hash[index] = numbers
    end
  end

  def lines_numbers
    lines.map { |line| line.numbers }
  end

  def find_real_parts(lines_with_potential_parts)
    lines_with_potential_parts.map do |line_index, potential_parts|
      potential_parts.select do |part|
        current_line = lines[line_index].value
        next true if symbol?(current_line[part[:start_index] - 1]) || symbol?(current_line[part[:end_index] + 1])

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

          start = [part[:start_index] - 1, 0].max
          finish = [part[:end_index] + 1, line.length - 1].min

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

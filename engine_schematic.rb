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

  def gear_ratios_sum
    gear_ratios.sum
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

  def gear_ratios
    real_gears.map(&:ratio)
  end

  def real_gears
    lines.flat_map.with_index do |line, line_index|
      line_real_gears(line, line_index)
    end
  end

  def line_real_gears(line, line_index)
    add_adjacent_numbers_to_gears(line, line_index)

    line.potential_gears.select do |gear|
      gear.adjacent_numbers.count == 2
    end
  end

  def add_adjacent_numbers_to_gears(line, line_index)
    line.potential_gears.each do |gear|
      adjacent_potential_parts = neighbourhood_lines(line, line_index).flat_map do |neighbourhood_line|
        neighbourhood_line.potential_parts.select do |potential_part|
          potential_part.index_range.to_a.intersect?(gear.neighbourhood_boundries.to_a)
        end
      end

      gear.add_adjacent_numbers(adjacent_potential_parts.map { |part| part.number.to_i })
    end
  end

  def neighbourhood_lines(line, line_index)
    start = [line_index - 1, 0].max
    finish = [line_index + 1, lines.length - 1].min

    lines[start..finish]
  end
end

puts EngineSchematic.new.parts_sum

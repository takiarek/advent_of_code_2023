require "minitest/autorun"

require_relative "engine_schematic"

class EngineSchematicTest < Minitest::Test
  def test_parts_sum
    assert_equal(4361, EngineSchematic.new(input: "../inputs/3/test_input.txt").parts_sum)
  end

  def test_gear_ratios_sum
    assert_equal(467835, EngineSchematic.new(input: "../inputs/3/test_input.txt").gear_ratios_sum)
  end
end

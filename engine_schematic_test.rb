require "minitest/autorun"

require_relative "engine_schematic"

class EngineSchematicTest < Minitest::Test
  def test_parts_sum
    assert_equal(4361, EngineSchematic.new(input: "../inputs/3/test_input.txt").parts_sum)
  end
end

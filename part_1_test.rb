require "minitest/autorun"

require_relative "part_1"

class Part1Test < Minitest::Test
  def test_parts_sum
    assert_equal(4361, EngineSchematic.new(input: "../inputs/3/test_input.txt").parts_sum)
  end
end

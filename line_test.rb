require "minitest/autorun"

require_relative "line"

class LineTest < Minitest::Test
  def test_potiential_gears
    potential_gears = Line.new("617*...**..").potential_gears

    assert_equal(3, potential_gears[0].index)
    assert_equal(7, potential_gears[1].index)
    assert_equal(8, potential_gears[2].index)
  end
end

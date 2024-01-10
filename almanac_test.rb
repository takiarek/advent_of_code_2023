require "minitest/autorun"

require_relative "almanac"

class AlmanacTest < Minitest::Test
  def test_nearest_location
    location = Almanac.new("../inputs/5/test_input.txt").nearest_location

    assert_equal(35, location)
  end
end

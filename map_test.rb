require "minitest/autorun"

require_relative "map"

class MapTest < Minitest::Test
  def test_nearest_location
    map_data = "50 98 2
    52 50 48"

    destination = Map.new(map_data).find_destination(79)

    assert_equal(81, destination)
  end
end

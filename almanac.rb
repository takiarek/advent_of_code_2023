require "debug"
require_relative "map"

class Almanac
  def initialize(input = "../inputs/5/input.txt")
    @almanac_sections = File.read(input).split("\n\n")
  end

  def nearest_location
    seeds.reduce(999_999_999_999_999_999_999_999) do |lowest_location, seed|
      location = maps.reduce(seed) do |source, map|
        map.find_destination(source)
      end

      [location, lowest_location].min
    end
  end

  private

  attr_reader :almanac_sections

  def seeds
    almanac_sections.first.split(": ")[1].split.collect(&:to_i)
  end

  def maps
    almanac_sections[1..almanac_sections.size - 1].collect do |map_data|
      Map.new(map_data.split(":\n")[1])
    end
  end
end

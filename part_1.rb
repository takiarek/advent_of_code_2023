require "debug"

almanac_sections = File.read("../inputs/5/input.txt").split("\n\n")

seeds = almanac_sections.first.split(": ")[1].split.map(&:to_i)
maps = almanac_sections[1..almanac_sections.size - 1].collect { |map| map.split(":\n")[1] }

result = seeds.reduce(999_999_999_999_999_999_999_999) do |lowest_location, seed|
  location = maps.reduce(seed) do |source, map|
    map.split("\n").reduce(nil) do |_, map_part|
      destination_range_start, source_range_start, range_size = map_part.split(" ").map(&:to_i)

      if (source_range_start..source_range_start + range_size - 1).cover?(source)
        break destination_range_start + source - source_range_start
      else
        source
      end
    end
  end

  [location, lowest_location].min
end

puts result

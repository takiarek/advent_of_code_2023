class Map
  def initialize(data)
    @data = data
  end

  def find_destination(source)
    to_s.split("\n").reduce(nil) do |_, map_part|
      destination_range_start, source_range_start, range_size = map_part.split(" ").collect(&:to_i)

      if (source_range_start..source_range_start + range_size - 1).cover?(source)
        break destination_range_start + source - source_range_start
      else
        source
      end
    end
  end

  def to_s
    @data
  end
end

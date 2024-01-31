class Map
  def initialize(data)
    @data = data
  end

  def find_destination(source)
    parts.reduce(nil) do |_, map_part|
      if (map_part.source_range_start..map_part.source_range_start + map_part.range_size - 1).cover?(source)
        break map_part.destination_range_start + source - map_part.source_range_start
      else
        source
      end
    end
  end

  private

  def parts
    @data.split("\n").collect { |part_data| MapPart.new(part_data) }
  end

  class MapPart
    attr_reader :destination_range_start, :source_range_start, :range_size

    def initialize(data)
      @destination_range_start, @source_range_start, @range_size = data.split(" ").collect(&:to_i)
    end
  end
end

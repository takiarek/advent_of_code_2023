class Map
  def initialize(data)
    @data = data
  end

  def find_destination(source)
    parts.reduce(nil) do |_, map_part|
      if map_part.cover?(source)
        break map_part.find_destination(source)
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

    def cover?(source)
      source_range.cover?(source)
    end

    def find_destination(source)
      destination_range_start + source - source_range_start
    end

    private

    def source_range
      (source_range_start..source_range_start + range_size - 1)
    end
  end
end

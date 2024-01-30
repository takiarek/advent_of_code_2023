class Map
  def initialize(data)
    @data = data
  end

  def find_destination(source)
    parts.reduce(nil) do |_, map_part|
      destination_range_start, source_range_start, range_size = map_part.to_s.split(" ").collect(&:to_i)

      if (source_range_start..source_range_start + range_size - 1).cover?(source)
        break destination_range_start + source - source_range_start
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
    def initialize(data)
      @data = data
    end

    def to_s
      @data
    end
  end
end

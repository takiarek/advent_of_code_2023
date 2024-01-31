class Map
  def initialize(data)
    @data = data
  end

  def find_destination(source)
    if source_range.include?(source)
      destination_range[source_index(source)]
    else
      source
    end
  end

  private

  def source_range
    parts.reduce([]) { |range_array, part| range_array + part.source_range.to_a }
  end

  def destination_range
    parts.reduce([]) { |range_array, part| range_array + part.destination_range.to_a }
  end

  def source_index(source)
    source_range.index(source)
  end

  def parts
    @data.split("\n").collect { |part_data| MapPart.new(part_data) }
  end

  class MapPart
    attr_reader :destination_range_start, :source_range_start, :range_size

    def initialize(data)
      @destination_range_start, @source_range_start, @range_size = data.split(" ").collect(&:to_i)
    end

    def source_range
      (source_range_start..source_range_start + range_size - 1)
    end

    def destination_range
      (destination_range_start..destination_range_start + range_size - 1)
    end
  end
end

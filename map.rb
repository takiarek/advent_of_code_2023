class Map
  def initialize(data)
    @data = data
  end

  def find_destination(source)
    get_destination(source)
  end

  private

  def cover?(source)
    parts.any? { |part| part.cover?(source) }
  end

  def get_destination(source)
    covering_part(source).find_destination(source)
  end

  def covering_part(source)
    parts.find { |part| part.cover?(source) } || MirrorMapPart.new
  end

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

  class MirrorMapPart
    def find_destination(source)
      source
    end
  end
end

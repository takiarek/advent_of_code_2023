class Line
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def numbers
    value.scan(/\d*/).reject(&:empty?)
  end
end

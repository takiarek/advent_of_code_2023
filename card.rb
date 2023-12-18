class Card
  def initialize(value)
    @value = value
  end

  def to_s
    @value
  end

  def winnning_and_my_numbers
    @value.split(": ")[1].split(" | ").map do |numbers_string|
      numbers_string.split(" ")
    end
  end
end

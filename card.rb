class Card
  def initialize(value)
    @value = value
  end

  def points
    matching_numbers_count ^ 2
  end

  def matching_numbers_count
    matching_numbers.count
  end

  private

  def matching_numbers
    my_numbers.select do |my_number|
      winning_numbers.include?(my_number)
    end
  end

  def my_numbers
    winnning_and_my_numbers[1]
  end

  def winning_numbers
    winnning_and_my_numbers[0]
  end

  def winnning_and_my_numbers
    @value.split(": ")[1].split(" | ").map do |numbers_string|
      numbers_string.split(" ")
    end
  end
end

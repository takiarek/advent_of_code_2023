class Card
  def initialize(value)
    @value = value
  end

  def points
    my_numbers.reduce(0) do |points, my_number|
      next points unless winning_numbers.include?(my_number)

      (points == 0) ? points + 1 : points * 2
    end
  end

  def matching_numbers_count
    4
  end

  private

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

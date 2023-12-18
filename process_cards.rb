class ProcessCards
  def initialize(input)
    @cards = File.readlines(input).map(&:strip)
  end

  def calculate_points
    cards.sum do |card|
      my_numbers(card).reduce(0) do |points, my_number|
        next points unless winning_numbers(card).include?(my_number)

        (points == 0) ? points + 1 : points * 2
      end
    end
  end

  private

  attr_reader :cards

  def winning_numbers(card)
    winnning_and_my_numbers(card)[0]
  end

  def my_numbers(card)
    winnning_and_my_numbers(card)[1]
  end

  def winnning_and_my_numbers(card)
    card.split(": ")[1].split(" | ").map do |numbers_string|
      numbers_string.split(" ")
    end
  end
end

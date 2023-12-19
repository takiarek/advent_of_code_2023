require_relative "card"

class ProcessCards
  def initialize(input)
    @cards = File.readlines(input).map(&:strip)
  end

  def calculate_points
    cards.sum do |card|
      card.my_numbers.reduce(0) do |points, my_number|
        next points unless card.winning_numbers.include?(my_number)

        (points == 0) ? points + 1 : points * 2
      end
    end
  end

  private

  def cards
    @cards.map { |card| Card.new(card) }
  end
end

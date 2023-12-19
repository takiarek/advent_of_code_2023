require_relative "card"

class ProcessCards
  def initialize(input)
    @cards = File.readlines(input).map(&:strip)
  end

  def calculate_points
    cards.sum do |card|
      card.points
    end
  end

  private

  def cards
    @cards.map { |card| Card.new(card) }
  end
end

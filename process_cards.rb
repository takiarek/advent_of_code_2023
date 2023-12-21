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

  def calculate_cards_won
    cards.sum do |card|
      cards_count_for(card)
    end
  end

  private

  def cards
    @cards.map { |card| Card.new(card) }
  end

  def cards_count_for(card)
    return 1 if card.matching_numbers_count == 0

    won_from_copies_count = won_copies_for(card).sum { |copy_card| cards_count_for(copy_card) }

    1 + won_from_copies_count
  end

  def won_copies_for(card)
    cards[card.number..card.number + card.matching_numbers_count - 1]
  end
end

require_relative "card"

class ProcessCards
  def initialize(input)
    @cards = File.readlines(input).map(&:strip)
    @cached_cards_counts = {}
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

  attr_reader :cached_cards_counts

  def cards
    @cards.map { |card| Card.new(card) }
  end

  def cards_count_for(card)
    return cached_cards_count_for(card) if cached_cards_count_for(card)

    return 1 if card.matching_numbers_count == 0

    cache_result(card, 1 + won_from_copies_count(card))
  end

  def cached_cards_count_for(card)
    cached_cards_counts[card.number]
  end

  def cache_result(card, result)
    cached_cards_counts[card.number] = cached_cards_counts[card.number].to_i + result
  end

  def won_from_copies_count(card)
    won_copies_for(card).sum { |copy_card| cards_count_for(copy_card) }
  end

  def won_copies_for(card)
    cards[card.number..card.number + card.matching_numbers_count - 1]
  end
end

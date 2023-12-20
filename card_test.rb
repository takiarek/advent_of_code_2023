require "minitest/autorun"

require_relative "card"

class CardTest < Minitest::Test
  def test_matching_numbers_count
    card = Card.new("Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53")

    assert_equal(4, card.matching_numbers_count)
  end

  def test_number
    card_1 = Card.new("Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53")
    card_7 = Card.new("Card 7: 41 48 83 86 17 | 83 86  6 31 17  9 48 53")

    assert_equal(1, card_1.number)
    assert_equal(7, card_7.number)
  end
end

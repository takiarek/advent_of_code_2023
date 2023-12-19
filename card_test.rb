require "minitest/autorun"

require_relative "card"

class CardTest < Minitest::Test
  def test_matching_numbers_count
    card = Card.new("Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53")

    assert_equal(4, card.matching_numbers_count)
  end
end

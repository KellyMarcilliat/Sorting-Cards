require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'

class CardTest < MiniTest::Test

  def test_it_exists
    card = Card.new("10", "Hearts")

    assert_instance_of Card, card
  end

  def test_it_sets_tens_digit
    card_1 = Card.new("5", "Diamonds")

    assert_equal 50, card_1.set_tens_in_numeric

    card_2 = Card.new("10", "Hearts")

    assert_equal 100, card_2.set_tens_in_numeric
  end

  def test_it_sets_ones_digit
    card_1 = Card.new("5", "Diamonds")
    card_1.set_tens_in_numeric

    assert_equal 52, card_1.set_ones_in_numeric

    card_2 = Card.new("10", "Hearts")
    card_2.set_tens_in_numeric

    assert_equal 103, card_2.set_ones_in_numeric
  end

  def test_it_sets_numeric
    card_1 = Card.new("5", "Diamonds")

    assert_equal 52, card_1.set_numeric

    card_2 = Card.new("10", "Hearts")

    assert_equal 103, card_2.set_numeric
  end
end

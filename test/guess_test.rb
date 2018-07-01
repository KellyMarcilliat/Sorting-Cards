require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/guess'

class GuessTest < MiniTest::Test
  def test_it_exists
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)

    assert_instance_of Guess, guess
  end

  def test_it_has_a_guess
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)

    assert_equal "10 of Hearts", guess.response
  end 

  # guess.card
  # => #<Card:0x007ffdf1820a90 @value="10", @suit="Hearts">
  # guess.response
  # => "10 of Hearts"
  # guess.correct?
  # => true
  # guess.feedback
  # => "Correct!"

# card = Card.new("Queen", "Clubs")
# guess = Guess.new("2 of Diamonds", card)
# guess.card
# => #<Card:0x007ffdf1820a90 @value = "Queen", @suit="Clubs">
# guess.response
# => "2 of Diamonds"
# guess.correct?
# => false
# guess.feedback
# => "Incorrect."
end
#

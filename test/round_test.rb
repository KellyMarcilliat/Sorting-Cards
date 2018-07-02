require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require 'lib/card'
require 'lib/guess'
require 'lib/deck'
require 'lib/round'

class RoundTest < MiniTest::Test
  def test_it_exists
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_instance_of Round, round
  end

  def test_it_holds_a_deck
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_equal [card_1, card_2], round.deck
  end 

end

# card_1 = Card.new("3","Hearts")
# card_2 = Card.new("4", "Clubs")
# deck = Deck.new([card_1, card_2])
# round = Round.new(deck)
# round.deck
# => #<Deck:0x007ffdf181b9c8 @cards=[...]>
# round.guesses
# => []
# round.current_card
# => #<Card:0x007ffdf1820a90 @value="3", @suit="Hearts">
# round.record_guess("3 of Hearts")
# => #<Guess:0x007ffdf19c8a00 @card=#<Card:0x007ffdf1820a90 @value="3", @suit="Hearts">, @response="3 of Hearts">
# round.guesses.count
# => 1
# round.guesses.first.feedback
# => "Correct!"
# round.number_correct
# => 1
# round.current_card
# => #<Card:0x007ffdf1820a90 @value="4", @suit="Clubs">
# round.record_guess("Jack of Diamonds")
# => #<Guess:0x007ffdf19c8a00 @card=#<Card:0x007ffdf1820a90 @value="4", @suit="Clubs">, @response="Jack of Diamonds">
# round.guesses.count
# => 2
# round.guesses.last.feedback
# => "Incorrect."
# round.number_correct
# => 1
# round.percent_correct
# => 50

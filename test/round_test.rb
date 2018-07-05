require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/guess'
require './lib/deck'
require './lib/round'

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

    assert_equal deck, round.deck
  end

  def test_it_has_empty_array_for_guesses
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_equal [], round.guesses
  end

  def test_it_tracks_current_card
    card_1 = Card.new("3", "Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_equal card_1, round.current_card
    assert_equal "3", round.current_card.value
    assert_equal "Hearts", round.current_card.suit

    round.record_guess({value: "Jack", suit: "Diamonds"})

    assert_equal card_2, round.current_card
    assert_equal "4", round.current_card.value
    assert_equal "Clubs", round.current_card.suit
  end

  def test_it_stores_guesses
    card_1 = Card.new("3", "Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_instance_of Guess, round.record_guess({value: "3", suit: "Hearts"})
  end

  def test_it_adds_to_guesses_array
    card_1 = Card.new("3", "Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess({value: "3", suit: "Hearts"})

    assert_equal 1, round.guesses.count

    round.record_guess({value: "Jack", suit: "Diamonds"})

    assert_equal 2, round.guesses.count
  end

  def test_guess_triggers_feedback
    card_1 = Card.new("3", "Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.current_card
    round.record_guess({value: "3", suit: "Hearts"})

    assert_equal "Correct!", round.guesses.first.feedback

    round.current_card
    round.record_guess({value: "Jack", suit: "Diamonds"})

    assert_equal "Incorrect!", round.guesses.last.feedback
  end

  def test_it_adds_to_number_correct
    card_1 = Card.new("3", "Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.current_card
    round.record_guess({value: "3", suit: "Hearts"})
    round.guesses.first.correct?
    round.add_to_number_correct

    assert_equal 1, round.number_correct

    round.record_guess({value: "Jack", suit: "Diamonds"})
    round.guesses.last.correct?
    round.add_to_number_correct

    assert_equal 1, round.number_correct
  end

  def test_it_calculates_percent_correct
    card_1 = Card.new("3", "Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.current_card
    round.record_guess({value: "3", suit: "Hearts"})
    round.guesses.first.correct?
    round.add_to_number_correct
    round.number_correct

    round.current_card
    round.record_guess({value: "Jack", suit: "Diamonds"})
    round.guesses.last.correct?
    round.add_to_number_correct
    round.number_correct

    assert_equal 50, round.percent_correct
  end
end

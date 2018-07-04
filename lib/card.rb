class Card

  attr_reader     :value,
                  :suit,
                  :numeric

  def initialize(value, suit)
    @value = value
    @suit = suit
    @numeric = 0
  end

  def set_numeric
    set_tens_in_numeric
    set_ones_in_numeric
  end

  def set_tens_in_numeric
    if value.to_i != 0
      @numeric = value.to_i * 10
    elsif value == "Jack"
      @numeric = 110
    elsif value == "Queen"
      @numeric = 120
    elsif value == "King"
      @numeric = 130
    else
      @numeric = 140
    end
  end

  def set_ones_in_numeric
    if suit == "Clubs"
      @numeric += 1
    elsif suit == "Diamonds"
      @numeric += 2
    elsif suit == "Hearts"
      @numeric += 3
    else
      @numeric += 4
    end
  end
end
card_1 = Card.new("3", "Diamonds")
# card_1.set_tens_in_numeric
p card_1.set_numeric
card_2 = Card.new("Jack", "Hearts")
# card_2.set_tens_in_numeric
p card_2.set_numeric
card_3 = Card.new("Ace", "Spades")
# card_3.set_tens_in_numeric
p card_3.set_numeric
card_4 = Card.new("King", "Clubs")
# card_4.set_tens_in_numeric
p card_4.set_numeric
card_5 = Card.new("Queen", "Diamonds")
# card_5.set_tens_in_numeric
p card_5.set_numeric

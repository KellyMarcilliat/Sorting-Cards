class Deck

  attr_reader   :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def sort_deck
    sorted_deck = @cards

    swapped = false

    length_of_sort = sorted_deck.length - 1

    length_of_sort.times.each do |i|

      if sorted_deck[i].numeric > sorted_deck[i+1].numeric

        a,b = sorted_deck[i].numeric,sorted_deck[i+1].numeric

        sorted_deck.delete_at(i)
        sorted_deck.insert(i+1, a)

        swapped = true
      end
    end
    if swapped == false
      return sorted_deck
    else
      sort_deck#(sorted_deck.numeric)
    end
    require 'pry'; binding.pry
  end
end

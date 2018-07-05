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

        a,b = sorted_deck[i],sorted_deck[i+1]

        sorted_deck.delete_at(i)
        sorted_deck.insert(i+1, a)

        swapped = true
      end
    end
    if swapped == false
      return sorted_deck
    else
      sort_deck
    end
  end

  def merge_sort_deck(card_array)
    if card_array.length <= 1
      card_array
    else
      mid = (card_array.length / 2).floor
      left = merge_sort_deck(card_array[0..mid - 1])
      right = merge_sort_deck(card_array[mid..card_array.length])
      merge_arrays(left, right)
    end
  end

  def merge_arrays(left, right)
    if left.empty?
      right
    elsif right.empty?
      left
    elsif left.first.numeric < right.first.numeric
      [left.first] + merge_arrays(left[1..left.length], right)
    else
      [right.first] + merge_arrays(left, right[1..right.length])
    end
  end
end

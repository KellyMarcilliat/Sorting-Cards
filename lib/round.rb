class Round

  attr_reader   :deck,
                :guesses,
                :number_correct

  def initialize(deck)
    @deck = deck
    @guesses = []
    @number_correct = 0
  end

  def current_card
    @current_card = @deck.cards[@guesses.count]
  end

  #creates a <Guess object w/ @card holding a <Card object including @value, @suit>, and holding @response string>    Note: Guess(response, card)
  #stores each guess in @guesses array
  def record_guess(response)
   @guesses << Guess.new(response, @current_card)
   @guesses[-1]
   # binding.pry
  end

  def add_to_number_correct
    if guesses.first.correct? == true
      @number_correct += 1
    end
  end

end

class Round

  attr_reader   :deck,
                :guesses,
                :number_correct,
                :response_string

  def initialize(deck)
    @deck = deck
    @guesses = []
    @number_correct = 0
    @response_string = ""
  end

  def current_card
    @current_card = @deck.cards[@guesses.count]
  end

  #creates a <Guess object w/ @card holding a <Card object including @value, @suit>, and holding @response string>    Note: Guess(response, card)
  #stores each guess in @guesses array
  def record_guess(response_hash)
    @response_string = "#{response_hash[:value]} of #{response_hash[:suit]}"
    @guesses << Guess.new(response_string, @current_card)
    @guesses[-1]
  end

  def add_to_number_correct
    if guesses[-1].correct? == true
      @number_correct += 1
    end
  end

  def percent_correct
    @number_correct.to_f / @guesses.count.to_f * 100
  end
end

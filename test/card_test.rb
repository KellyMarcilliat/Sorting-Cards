require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'

class CardTest < MiniTest::Test

  def test_it_exists
    card = Card.new("10", "Hearts")

    assert_instance_of Card, card
  end
end

require_relative "deck"

class Hand
  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

end

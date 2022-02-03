class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(card_index)
    @cards.at(card_index).rank
  end

end

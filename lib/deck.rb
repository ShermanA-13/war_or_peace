class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(card_index)
    @cards.at(card_index).rank
  end

  def high_ranking_cards
    @cards.select do |card|
      card if card.rank >= 11
    end
  end

end

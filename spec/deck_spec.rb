require 'rspec'
require './lib/card'
require './lib/deck'
require 'pry'

describe Deck do
  card1 = Card.new(:diamond, 'Queen', 12)
  card2 = Card.new(:spade, '3', 3)
  card3 = Card.new(:heart, 'Ace', 14)
  card4 = Card.new(:club, '5', 5)

  cards = [card1, card2, card3]

  deck = Deck.new(cards)

  it 'holds cards' do
      expect(deck.cards).to eq([card1, card2, card3])
    end

    it 'returns rank of cards in index' do
      expect(deck.rank_of_card_at(0)).to eq(12)
      expect(deck.rank_of_card_at(1)).to eq(3)
      expect(deck.rank_of_card_at(2)).to eq(14)
    end

    it 'returns high ranking cards' do
     expect(deck.high_ranking_cards).to eq([card1, card3])
   end

   it 'returns percent of high ranking cards' do
     expect(deck.percent_high_ranking).to eq(66.67)
   end

   it 'removes the top card' do
    expect(deck.remove_card).to eq(card1)
    expect(deck.percent_high_ranking).to eq(50.0)
  end

  it 'adds card to bottom/end of deck' do
    expect(deck.cards).to eq([card2, card3])
    expect(deck.add_card(card4)).to eq([card2, card3, card4])
    expect(deck.percent_high_ranking).to eq(33.33)
  end
end

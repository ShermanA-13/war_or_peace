require 'rspec'
require './lib/card'
require './lib/deck'
require 'pry'

describe Deck do

  it 'holds cards' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)

      cards = [card1, card2, card3]

      deck = Deck.new(cards)

      expect(deck.cards).to eq([card1, card2, card3])
    end

    it 'returns rank of cards in index' do
         card1 = Card.new(:diamond, 'Queen', 12)
         card2 = Card.new(:spade, '3', 3)
         card3 = Card.new(:heart, 'Ace', 14)

         cards = [card1, card2, card3]

         deck = Deck.new(cards)

      expect(deck.rank_of_card_at(0)).to eq(12)
      expect(deck.rank_of_card_at(1)).to eq(3)
      expect(deck.rank_of_card_at(2)).to eq(14)
    end

    it 'returns high ranking cards' do
     card1 = Card.new(:diamond, 'Queen', 12)
     card2 = Card.new(:spade, '3', 3)
     card3 = Card.new(:heart, 'Ace', 14)

     cards = [card1, card2, card3]

     deck = Deck.new(cards)

     expect(deck.high_ranking_cards).to eq([card1, card3])
   end

   it 'returns percent of high ranking cards' do
         card1 = Card.new(:diamond, 'Queen', 12)
         card2 = Card.new(:spade, '3', 3)
         card3 = Card.new(:heart, 'Ace', 14)

         cards = [card1, card2, card3]

         deck = Deck.new(cards)

    expect(deck.percent_high_ranking).to eq(66.67)
   end

end

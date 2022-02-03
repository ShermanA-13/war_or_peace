require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require 'pry'

describe Player do
  card1 = Card.new(:diamond, 'Queen', 12)
  card2 = Card.new(:spade, '3', 3)
  card3 = Card.new(:heart, 'Ace', 14)

  cards = [card1, card2, card3]

  deck = Deck.new(cards)

  player = Player.new('Clarissa', deck)

  it 'creates a player with a deck of cards' do
      expect(player).to be_an_instance_of(Player)
  end

  it 'has a name' do
    expect(player.name).to eq('Clarissa')
  end
end

require 'rspec'
require 'pry'
require './lib/standard_deck'
require './lib/game'
require './lib/turn'
require './lib/card'

describe Game do

  game = Game.new
  full_deck = StandardDeck.new

  it 'exits' do
    expect(game).to be_an_instance_of(Game)
  end

  it 'can creates a full deck' do
    game.full_deck.create_standard_deck
    expect(game.full_deck.cards.length).to eq(52)
  end

  it 'creates 2 randomized decks from the full deck' do
    expect(game.split_deck.cards.length)
  end

end

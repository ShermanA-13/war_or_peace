require 'rspec'
require 'pry'
require './lib/card'
require './lib/standard_deck'

describe StandardDeck do

  new_deck = StandardDeck.new

  new_deck.create_standard_deck

  it 'exists' do
    expect(new_deck).to be_an_instance_of(StandardDeck)
  end

  it 'knows those cards can be 4 different suits' do
    expect(new_deck.cards.length).to eq(52)
  end
  binding.pry
end

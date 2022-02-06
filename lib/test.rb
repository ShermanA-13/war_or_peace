require './lib/standard_deck'
require './lib/turn'
require './lib/card'

class Test
  attr_reader :full_deck,
              :cards,
              :deck,
              :turn,
              :greeting,
              :standard_deck

  def initialize
    @greeting = greeting
    @full_deck = StandardDeck.new
  end

def greeting
  puts "Test"
end

  def create
    @full_deck.create_standard_deck
  end
end

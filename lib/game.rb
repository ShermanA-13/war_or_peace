require './lib/standard_deck'
require './lib/turn'
require './lib/card'
require './lib/player'
require './lib/deck'


class Game
  attr_reader :standard_deck,
              :full_deck,
              :turn,
              :player,
              :deck,
              :cards

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

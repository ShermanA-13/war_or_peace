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
    @full_deck = StandardDeck.new
    greeting
  end



  def greeting
    puts 'Please enter Player 1 name.'
    player1 = gets
    puts 'Please enter Player 2 name'
    player2 = gets
    puts "Welcome to War! (Peace was never an option)."
    puts "This game is played with 52 cards."
    puts "Today's players are #{player1.chomp} and #{player2.chomp}"
    puts "Let the games begin!"
  end




  def create
    @full_deck.create_standard_deck
  end
end

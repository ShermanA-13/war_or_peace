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
    @full_deck = StandardDeck.new
    @turns = []
  end

  def split_deck
    @full_deck.create_standard_deck
    shuffled_deck = @full_deck.cards.shuffle
    @deck1 = Deck.new(shuffled_deck[0..25])
    @deck2 = Deck.new(shuffled_deck[26..52])
  end

  def greeting
    puts 'Please enter Player 1 name.'
    @player1 = gets
    puts 'Please enter Player 2 name'
    @player2 = gets
    puts "Welcome to War! (Peace was never an option)."
    puts "This game is played with 52 cards."
    puts "Today's players are #{@player1.chomp} and #{@player2.chomp}"
    puts "Enter 'GO' to continue."
    puts "Let the games begin!"
  end


end

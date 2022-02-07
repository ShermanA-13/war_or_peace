require './lib/standard_deck'
require './lib/turn'
require './lib/card'
require './lib/player'
require './lib/deck'
require 'pry'

class Game
  attr_reader :full_deck,
              :turn,
              :player1,
              :player2,
              :greeting

  def initialize
    @full_deck = StandardDeck.new
    @greeting = greeting
  end

  def greeting
    puts 'Please enter Player 1 name.'
    @player1 = gets
    puts 'Please enter Player 2 name'
    @player2 = gets
    puts "Welcome to War! (Peace was never an option)."
    puts "This game is played with 52 cards."
    puts "Today's players are #{player1.chomp} and #{player2.chomp}"
    puts "Enter 'GO' to continue. If you want to stop enter 'exit or quit'."
    run_inputs
  end

  def run_inputs
    run = gets.chomp
      if run = /go/i.match('go')
        start_game
        puts "Let the games begin!".center(50, '~')
      elsif run = /(?:ex|qu)it/i.match(?:'quexit')
        game.abort("War is not for the faint hearted.")
        else
       puts 'Invalid Input'.center(50, '+')
    end
  end

  def start_game
    def split_deck
      @full_deck.create_standard_deck
      shuffled_deck = @full_deck.cards.shuffle
      @deck1 = Deck.new(shuffled_deck[0..25])
      @deck2 = Deck.new(shuffled_deck[26..52])
    end

    split_deck

    @player1 = Player.new(player1, @deck1)
    @player2 = Player.new(player2, @deck2)
    @turn = Turn.new(@player1, @player2)

      count = 0
    until @turn.player1.deck.cards == [] || @turn.player2.deck.cards == [] || count == 100000
      count += 1

      type = @turn.type
      winner = @turn.winner
      @turn.pile_cards
      @turn.award_spoils(winner) #unless its MAD
      @turn_count = count

      if type == :basic
          puts "Turn #{count}: #{winner.name.chomp} won 2 cards."
      elsif type == :war
          puts "☠️Turn #{count}: WAR #{winner.name.chomp} won 6 cards.☠️"
      elsif type == :mutually_assured_destruction
       puts "💥💣Mutually Assured Destruction💣💥 6 cards removed from play"
      end
    end

      if @player1.has_lost?
        puts "#{@player2.chomp} has survived the game!".center(50, '💥')
      elsif @player2.has_lost?
        puts "#{@player1.chomp} has survived the game!".center(50, '💥')
      else
        puts 'DRAW'.center(50, '☠️')
  end
 end
   binding.pry
end

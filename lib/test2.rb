require './lib/standard_deck'
require './lib/turn'
require './lib/card'
require './lib/player'
require './lib/deck'
require 'pry'

def start_game
  def split_deck
    @full_deck.create_standard_deck
    shuffled_deck = @full_deck.cards.shuffle
    @deck1 = Deck.new(shuffled_deck[0..25])
    @deck2 = Deck.new(shuffled_deck[26..51])
    # binding.pry
  end
binding.pry
  split_deck

  @player1 = Player.new(@player1, @deck1)
  @player2 = Player.new(@player2, @deck2)
  @turn = Turn.new(@player1, @player2)

    count = 0
  until @turn.player1.deck.cards == [] || @turn.player2.deck.cards == [] || count == 100000
    count += 1

    type = @turn.type
    winner = @turn.winner
    spoils_count = @turn.spoils_of_war
    @turn.pile_cards
    @turn.award_spoils(winner) #unless its MAD
    @turn_count = count

    if type == :draw
      puts 'DRAW'.center(50, '☠️')
    elsif type == :basic
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

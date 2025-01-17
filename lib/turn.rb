require './lib/card'
require './lib/deck'
require './lib/player'

class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war,
              :winner

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
      if @player1.deck.cards.length < 3 || @player2.deck.cards.length < 3
        :draw
      elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
        :mutually_assured_destruction
      elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
        :war
      elsif @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
        :basic
      end
    end

    def winner
        if type == :mutually_assured_destruction
            puts "No Winner"
        elsif type == :war && @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
          @player1
        elsif type == :war && @player1.deck.rank_of_card_at(2) < @player2.deck.rank_of_card_at(2)
          @player2
        elsif type == :basic && @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
          @player1
        elsif type == :basic && @player1.deck.rank_of_card_at(0) < @player2.deck.rank_of_card_at(0)
          @player2
        elsif type == :draw && @player1.deck.cards.length < 3 || @player2.deck.cards.length < 3
          if @player1.deck.cards.length < 2 || @player2.deck.cards.length < 2
             if :basic && @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
               @player2
             elsif :basic && @player1.deck.rank_of_card_at(0) < @player2.deck.rank_of_card_at(0)
               @player1
             else @player.has_lost?
            end
          end
        end
      end

    def pile_cards
      if type == :mutually_assured_destruction
        3.times {@player1.deck.remove_card && @player2.deck.remove_card}
      elsif type == :war
        3.times {@spoils_of_war << @player1.deck.remove_card && @player2.deck.remove_card}
      else type == :basic
        @spoils_of_war << @player1.deck.remove_card
        @spoils_of_war << @player2.deck.remove_card
      end
    end

    def award_spoils(winner)
        winner.deck.cards << @spoils_of_war
    end
end

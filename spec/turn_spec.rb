require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require 'pry'

describe Turn do
  card1 = Card.new(:heart, 'Jack', 11)
  card2 = Card.new(:heart, '10', 10)
  card3 = Card.new(:heart, '9', 9)
  card4 = Card.new(:diamond, 'Jack', 11)
  card5 = Card.new(:heart, '8', 8)
  card6 = Card.new(:diamond, 'Queen', 12)
  card7 = Card.new(:heart, '3', 3)
  card8 = Card.new(:diamond, '2', 2)
  card9 = Card.new(:heart, 'Jack', 11)
  card10 = Card.new(:heart, '10', 10)
  card11 = Card.new(:heart, '9', 9)
  card12 = Card.new(:diamond, 'Jack', 11)
  card13 = Card.new(:heart, '8', 8)
  card14 = Card.new(:diamond, '8', 8)
  card15 = Card.new(:heart, '3', 3)
  card16 = Card.new(:diamond, '2', 2)

  deck1 = Deck.new([card1, card2, card5, card8])
  deck2 = Deck.new([card3, card4, card6, card7])
  deck3 = Deck.new([card9, card10, card13, card16])
  deck4 = Deck.new([card12, card11, card14, card15])

  player1 = Player.new('Megan', deck1)
  player2 = Player.new('Aurora', deck2)
  player3 = Player.new('Jeremy', deck3)
  player4 = Player.new('Candy', deck4)

  turn = Turn.new(player1, player2)
  turn1 = Turn.new(player3, player4)

  winner = turn.winner

  it 'exists' do
    expect(turn).to be_an_instance_of(Turn)
  end

  it 'creates two players with decks' do
    expect(turn.player1.name).to eq('Megan')
    expect(turn.player1.deck).to eq(deck1)
    expect(turn.player2.name).to eq('Aurora')
    expect(turn.player2.deck).to eq(deck2)
    expect(turn.spoils_of_war).to eq([])
  end

  it 'first two cards of player 1 and 2 is a basic turn' do
    expect(turn.type).to eq(:basic)
  end

  it 'determins winner for card' do
    expect(turn.winner.name).to eq('Megan')
  end


  it 'either completely removes or shovels cards into spoils_of_war' do
    turn.pile_cards
    expect(turn.spoils_of_war).to eq([card1, card3])
  end

  it 'gives spoils_of_war to winner' do
    turn.pile_cards
    turn.award_spoils(winner)
  end

  it 'returns type :mutually_assured_destruction and behaviors' do
    turn1.type
    turn1.winner
    expect(turn1.winner).to eq("No Winner")

    turn1.pile_cards
    turn1.spoils_of_war
    player3.deck
    player4.deck
    expect(player3.deck.cards).to eq([card16])
    expect(player4.deck.cards).to eq([card15])
  end
end

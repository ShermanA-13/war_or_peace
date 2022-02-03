class Card
  attr_reader :suit,
              :value,
              :rank

  def initalize(suit, value, rank)
    @suit = suit
    @value = value
    @rank = rank
  end
end

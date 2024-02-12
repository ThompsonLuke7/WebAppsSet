class Deck
  attr_accessor :cards

  COLORS = [:red, :green, :purple]
  NUMBERS = [1,2,3]
  SHAPES = [:diamond, :squiggle, :oval]
  SHADINGS = [:sold, :striped, :open]

  def initialize_deck
    @cards = generate_cards
    shuffle_deck
  end

  def generate_cards
    deck = []

    COLORS.each do |color|
      NUMBERS.each do |number|
        SHAPES.each do |shape|
          SHADINGS.each do |shading|
            card = {color: color, number: number, shape: shape, shading: shading}
            deck << card
          end
        end
      end
    end
    deck
  end

  def shuffle_deck
    @cards.shuffle!
  end

  def deal_cards
    dealt_cards = []
    if @cards.length >= 12
      dealt_cards = @cards.shift(12)

    else
    dealt_cards = @cards.shift(@cards.size)
    end
    dealt_cards
  end
end

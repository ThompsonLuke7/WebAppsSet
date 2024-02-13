class Deck
  attr_accessor :cards

  INDEX =*(0..81)
  COLORS = [:red, :green, :purple]
  NUMBERS = [1,2,3]
  SHAPES = [:diamond, :squiggle, :oval]
  SHADINGS = [:solid, :striped, :open]

  def initialize_deck
    @cards = generate_cards
    shuffle_deck
  end

  def generate_cards
    deck = []
    INDEX.each do |index|
    COLORS.each do |color|
      NUMBERS.each do |number|
        SHAPES.each do |shape|
          SHADINGS.each do |shading|
            card = {index: index, color: color, number: number, shape: shape, shading: shading}
            deck << card
          end
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
    dealt_cards = @cards.shift(12)
    dealt_cards
  end

  def draw_new_cards
    new_cards = []
    if @cards.length >= 3
      new_cards = @cards.shift(3)
    else
      @game.out_of_cards
    end
    new_cards
  end

  def is_set?(chosen_card_array)
  chosen_card_array.inspect
  card1 = chosen_card_array[0]
  card2 = chosen_card_array[1]
  card3 = chosen_card_array[2]

  (
    (card1[:color] == card2[:color] && card1[:color] == card3[:color] && card2[:color] == card3[:color]) ||
    (card1[:color] != card2[:color] && card1[:color] != card3[:color] && card2[:color] != card3[:color])
  ) &&
  (
    (card1[:shape] == card2[:shape] && card1[:shape] == card3[:shape] && card2[:shape] == card3[:shape]) ||
    (card1[:shape] != card2[:shape] && card1[:shape] != card3[:shape] && card2[:shape] != card3[:shape])
  ) &&
  (
    (card1[:shading] == card2[:shading] && card1[:shading] == card3[:shading] && card2[:shading] == card3[:shading]) ||
    (card1[:shading] != card2[:shading] && card1[:shading] != card3[:shading] && card2[:shading] != card3[:shading])
  ) &&
  (
    (card1[:number] == card2[:number] && card1[:number] == card3[:number] && card2[:number] == card3[:number]) ||
    (card1[:number] != card2[:number] && card1[:number] != card3[:number] && card2[:number] != card3[:number])
  )
end

def check_correctness(chosen_set)
  result = 0
  if is_set?(chosen_set)
      puts "Congrats"
      result = 1
  else
      puts "Sorry, incorrect"
  end
  result
end
end

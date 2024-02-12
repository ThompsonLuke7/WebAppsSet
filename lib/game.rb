require_relative 'player_creator'
require_relative 'deck'

class Game

    def initialize
        @player_creator = PlayerCreator.new
    end

    def add_players
        @players = @player_creator.get_players
        puts "Welcome #{@players.join(' and ')}"
    end

    def start
        puts "welcome to set"
        @deck = Deck.new
        @deck.initialize_deck
        dealt_cards = @deck.deal_cards
        display_hand(dealt_cards)
    end

    def display_hand(dealt_cards)
        puts "Your Hand: "
        dealt_cards.each do |card|
            puts "#{card[:color]} #{card[:number]} #{card[:shape]} #{card[:shading]}"
        end
    end



end

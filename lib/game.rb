require_relative 'player_creator'
require_relative 'deck'
require_relative 'player'

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
        choose_a_set(dealt_cards)
    end

    def display_hand(dealt_cards)
        puts "Your Hand: "
        dealt_cards.each do |card|
            puts "#{card[:index]}. #{card[:color]} #{card[:number]} #{card[:shape]} #{card[:shading]}"
        end
    end

    def choose_a_set(dealt_cards)
        puts "Please enter the indices of the 3 cards in your Set, separated by a comma: "
        chosen_indices = []
        chosen_indices << gets.chomp.split(',').map(&:to_i)
        chosen_indices.flatten!
        chosen_set = []
        chosen_indices.each do |index|
           selected_card = dealt_cards.find { |card| card[:index] == index }
            chosen_set << selected_card if selected_card
        end
            puts "You have chosen the set: "
            chosen_set.each do |card|
                puts "#{card[:index]}. #{card[:color]} #{card[:number]} #{card[:shape]} #{card[:shading]}"
            end


            result = @deck.check_correctness(chosen_set)
            @players[0].increase_score(result)
            @players[0].print_score
            if result == 1
            dealt_cards.delete_if { |card| chosen_set.include?(card) }
            puts "Drawing 3 new cards!"
            dealt_cards.concat(@deck.draw_new_cards)
            end

            display_hand(dealt_cards)
            choose_a_set(dealt_cards)
    end

    def out_of_cards
        puts "Deck is out of cards. Terminating!"
        @players[0].print_score
        @players[1].print_score
        exit
    end
end

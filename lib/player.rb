class Player
    attr_reader :name

    def initialize(name)
        @name = name
        @score = 0
    end

    def to_s
        "#{@name}"
    end

    def increase_score(points)
        @score += points
      end

    def print_score
        puts "#{@name}'s score:#{@score}"
    end

end

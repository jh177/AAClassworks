require 'singleton'

class Nullpiece < Piece

    include Singleton

    attr_reader :color, :symbol

    def initialize

    end

    def moves
        (0..7).to_a.product((0..7).to_a)
    end
    
    def symbol
        :Null
    end

end
require_relative "piece.rb"
require_relative "slideable.rb"

class Rook < Piece

include Slideable

  def initialize(color, board, pos)
    super
  end

  def symbol
    :Rook
  end

  def moves
    horizontal_dirs
    self.moves
    # move_dirs --> self.moves
  end

  private

  def move_dirs
    self.horizontal_dirs
  end

end

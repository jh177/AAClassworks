
class Piece

  attr_reader :color, :pos
  attr_accessor :board

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def to_s

  end

  def empty?
    r, c = pos
    return true if @board[r][c].is_a?(Nullpiece)
    false
  end

  def valid_moves
    result = []
    (0..7).each do |r|
      (0..7).each do |c|
        if @board[r][c].nil? && @board.valid_pos?([r,c]) && self.moves.include?([r,c])
          result << [r,c]
        end
      end
    end
    result
  end

  def pos=(val)
    @pos = val
  end
  
  # def symbol
  #   @symbol = nil
  # end

  private

  def move_into_check?(end_pos)
    king_pos = @board.find_king(color)
    dup = self.dup
    dup.pos = end_pos
    dup.valid_moves.include?(king_pos)
  end

end
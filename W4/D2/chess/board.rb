
class Board

  attr_accessor :rows

  def initialize
    @rows = Array.new(8) {Array.new(8)}
  end

  def [](pos)
    row, col = pos
    @rows[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @rows[row][col] = val
  end

  def valid_pos?(pos)
    row, col = pos
    return false if !row.between?(0,7) || !col.between?(0,7) || @rows[pos].nil?
    true
  end

  def add_piece(piece, pos)
    if valid_pos?(pos)
      @rows[pos] = piece
    else
      raise "can not add piece!"
    end
  end

  def checkmate?(color)

  end

  def in_check?(color)

  end

  def find_king(color)
    
  end

  def move_piece!(color, start_pos, end_pos)
    piece = @rows[start_pos]
    
  end



end

require_relative "./pieces/piece.rb"
require_relative "./pieces/bishop.rb"
require_relative "./pieces/king.rb"
require_relative "./pieces/knight.rb"
require_relative "./pieces/nullpiece.rb"
require_relative "./pieces/pawn.rb"
require_relative "./pieces/queen.rb"
require_relative "./pieces/rook.rb"


class Board

  attr_accessor :rows

  def initialize
    @rows = Array.new(8) {Array.new(8)}
    populate
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
      self[pos] = piece
    else
      raise "can not add piece!"
    end
  end

  def checkmate?(color)

  end

  def in_check?(color)

  end

  def find_king(color)
    # return opponent's king position
  end

  def move_piece!(start_pos, end_pos)
    raise "no piece at #{start_pos}" if self[start_pos].nil?
    raise "cannot move to #{end_pos}" if !self[end_pos].nil?
    piece = self[start_pos]
    self[end_pos] = piece
    self[start_pos] = nil
  end


    def populate
      (0..7).each do |j|
        @rows[1][j] = Pawn.new("black", self, [1, j])
        @rows[6][j] = Pawn.new("white", self, [6, j])
      end

      [2,3,4,5].product((0..7).to_a).each do |pos|
        r, c = pos
        @rows[r][c] = Nullpiece.new
      end
      
      @rows[0][0] = Rook.new("black", self, [0,0])
      @rows[0][7] = Rook.new("black", self, [0,7])
      @rows[7][0] = Rook.new("white", self, [7,0])
      @rows[7][7] = Rook.new("white", self, [7,7])

      @rows[0][1] = Knight.new("black", self, [0,1])
      @rows[0][6] = Kngiht.new("black", self, [0,6])
      @rows[7][1] = Knight.new("white", self, [7,1])
      @rows[7][6] = Knight.new("white", self, [7,6])

      @rows[0][2] = Bishop.new("black", self, [0,2])
      @rows[0][5] = Bishop.new("black", self, [0,5])
      @rows[7][2] = Bishop.new("white", self, [7,2])
      @rows[7][5] = Bishop.new("white", self, [7,5])

      @rows[0][3] = Queen.new("black", self, [0,3])
      @rows[7][3] = Queen.new("white", self, [7,3])

      @rows[0][4] = King.new("black", self, [0,4])
      @rows[7][4] = King.new("white", self, [7,4])

    end

end
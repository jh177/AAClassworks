
require_relative "./pieces/piece.rb"

class Board

  attr_accessor :rows

  def initialize
    @rows = Array.new(8) {Array.new(8)}
    set_pos = [0, 1].product((0..7).to_a) + [6, 7].product((0..7).to_a)
    set_pos.each {|pos| @rows[pos[0]][pos[1]] = Piece.new }
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
    
  end

  def move_piece!(start_pos, end_pos)
    raise "no piece at #{start_pos}" if self[start_pos].nil?
    raise "cannot move to #{end_pos}" if !self[end_pos].nil?
    piece = self[start_pos]
    self[end_pos] = piece
    self[start_pos] = nil
  end





end
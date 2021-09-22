require_relative "piece.rb"

class Pawn < Piece

attr_accessor :at_start_row

  def initialize(color, board, pos)
    super
    @at_start_row = true
  end

  def symbol
    :Pawn
  end

  def moves
    result = []
    r,c = self.pos
    steps = forward_steps.map {|step| step * forward_dir}
    #[1],[1,2]
    steps.each {|step| result << [r+step,c]}
    result
  end

  def at_start_row?
    if (self.pos[0] == 1 && color == "black") || (self.pos[0] == 6 && color == "white")
      at_start_row = true
    else
      at_start_row = false
    end
  end

  private

  def plus_dir(pos, dir_pos)
    [pos, dir_pos].transpose.map(&:sum)
  end

  def forward_dir
    return -1 if color == "white"
    return 1 if color == "black"
  end

  def forward_steps
    if self.at_start_row?
      return [1,2] 
    else
      return [1]
    end
    # 1 or 2, -1 or -2 depending on color
  end

  def side_attacks
    
  end

end
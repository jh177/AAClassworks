

module Stepable

  KNIGHT_DIFFS = [[2,1],[1,2],[-1,2],[2,-1],[-1,-2],[1,-2],[-2,-1],[-2,1]]
  KING_DIFFS = [[1,1],[-1,-1],[1,-1],[-1,1],[1,0],[0,1],[-1,0],[0,-1]]

  attr_reader :diff

  def king_diffs
    @diff = "king_diff"
  end

  def knight_diffs
    @diff= "knight_diff"
  end


  def moves
    result = []
    if diff == "king_diff"
      start_pos = self.pos
      KING_DIFFS.each do |dir_pos|
        move_pos = start_pos
        move_pos = plus_dir(move_pos, dir_pos)
        result << move_pos if move_pos[0].between?(0,7) && move_pos[1].between?(0,7)
      end
    else 
      start_pos = self.pos
      KNIGHT_DIFFS.each do |dir_pos|
        move_pos = start_pos
        move_pos = plus_dir(move_pos, dir_pos)
        result << move_pos if move_pos[0].between?(0,7) && move_pos[1].between?(0,7)
      end
    end
    result
  end

  private

  def plus_dir(pos, dir_pos)
    [pos, dir_pos].transpose.map(&:sum)
  end

  # def move_dirs
    
  # end

  def grow_unblocked_moves_in_dir(dx, dy)

  end

end
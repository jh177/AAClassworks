require "byebug"

module Slideable

  HORIZTONAL_DIRS = [[0,1],[0,-1],[-1,0],[1,0]]
  DIAGONAL_DIRS = [[1,1],[-1,-1]]

  attr_reader :direction

  def horizontal_dirs
    @direction = "horizontal"
  end

  def diagonal_dirs
    @direction = "diagonal"
  end

  def moves
    result = []
    if direction == "horizontal"
      start_pos = self.pos
      HORIZTONAL_DIRS.each do |dir_pos|
        move_pos = start_pos
        while move_pos[0].between?(0,7) && move_pos[1].between?(0,7)
          move_pos = plus_dir(move_pos, dir_pos)
          result << move_pos if move_pos[0].between?(0,7) && move_pos[1].between?(0,7)
        end
      end
    elsif direction == "diagonal"
      start_pos = self.pos
      DIAGONAL_DIRS.each do |dir_pos|
        move_pos = start_pos
        while move_pos[0].between?(0,7) && move_pos[1].between?(0,7)
          move_pos = plus_dir(move_pos, dir_pos)
          result << move_pos if move_pos[0].between?(0,7) && move_pos[1].between?(0,7)
        end
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
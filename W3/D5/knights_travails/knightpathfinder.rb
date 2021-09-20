
require_relative "00_tree_node.rb"

class KnightPathFinder

  def initialize(start_pos)
    @root_node = PolyTreeNode.new(start_pos)
    @considered_pos = [start_pos]
  end

  def valid_moves(pos)
    row, col = pos
    @considered_pos.each do |curr_pos|
      curr_row, curr_col = curr_pos
      if (curr_row - row).abs == 1 && (curr_col - col).abs == 2
        return true
      elsif (curr_row - row).abs == 2 && (curr_col - col).abs == 1
        return true
      end
    end
    false
  end

end
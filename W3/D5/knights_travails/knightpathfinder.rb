
require_relative "../polytreenode/lib/00_tree_node.rb"

class KnightPathFinder

  attr_reader :root_node, :considered_pos

  def initialize(start_pos)
    @root_node = PolyTreeNode.new(start_pos)
    @considered_pos = [@root_node]
  end

  def self.valid_moves(pos)
    result = []
    pos_row, pos_col = pos
    (0..7).each do |col|
      (0..7).each do |row|
        if (col - pos_col).abs == 1 && (row - pos_row).abs == 2
          result << PolyTreeNode.new([row, col])
        elsif (col - pos_col).abs == 2 && (row - pos_row).abs == 1
          result << PolyTreeNode.new([row, col])
        end
      end
    end
    result #[node, node, node]
  end

  def new_move_positions(pos) #[1,2]
    possible_moves = KnightPathFinder.valid_moves(pos) #[node, node]
    possible_moves.reject! do |node|
      @considered_pos.any? do |considered_node|
        considered_node.value == node.value
      end
    end
    @considered_pos += possible_moves
    possible_moves
  end

  def build_move_tree
    # q <-- [0,0]
    # 
    queue = [self.root_node]
    until queue.empty?
      curr_node = queue.shift
      # return curr_pos if curr_pos.value == target_pos.value
      new_moves = self.new_move_positions(curr_node.value) # array of nodes
      new_moves.each do |child|
        child.parent = curr_node
        curr_node.add_child(child)
      end
      queue += new_moves
    end
  end

  def find_node(root_node, end_pos)
    return root_node if root_node.value == end_pos

    root_node.children.each do |child|
      search_res = find_node(child, end_pos)
      return search_res unless search_res.nil?
    end
    nil
  end

  def find_path(end_pos)
    self.build_move_tree

    end_node = find_node(@root_node, end_pos)
    self.trace_path_back(end_node) if !end_node.nil?
  end

  def trace_path_back(end_node)
    path = [end_node.value]
    until end_node.parent.nil?
      path.unshift(end_node.parent.value)
      end_node = end_node.parent 
    end
    path
  end

end

class PolyTreeNode

  attr_reader :parent, :children, :value


  def initialize(value)
    @parent = nil
    @children = []
    @value = value
  end

  def parent=(node)
    if !self.parent.nil?
      @parent.children.delete(self)
    end
    @parent = node
    if !node.nil? && !node.children.include?(self)
      node.children << self
    end
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    raise "Not a child" if !self.children.include?(child_node)
    child_node.parent = nil
  end


  # Searchables

  def dfs(target_value)
    return self if self.value == target_value

    self.children.each do |child|
      search_res = child.dfs(target_value)
      unless search_res.nil?
        return search_res
      end
    end
    nil
  end

  def bfs(target_value)
    queue = []
    queue << self

    until (queue.empty?)
      curr_node = queue.shift
      return curr_node if curr_node.value == target_value
      curr_node.children.each do |child|
        queue << child
      end
    end
    nil
  end

end

# class Searchable

#   def dfs(target_value)
#     return 

#   end

# end

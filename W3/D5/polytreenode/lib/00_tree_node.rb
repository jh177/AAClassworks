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

end

# p node_1 = PolyTreeNode.new(1)
# p node_2 = PolyTreeNode.new(2)
# p node_1.children << node_2
# p node_2.parent= node_1
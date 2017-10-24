class BinaryTree
  attr_accessor :root

  def insert(new_node, node = root)
    if root.nil?
      self.root = new_node
    elsif node.nil?
      new_node
    else
      if new_node < node
        node.left = insert(new_node, node.left)
      else
        node.right = insert(new_node, node.right)
      end

      node
    end
  end

  def to_s
    self.root.to_s.squeeze(" ").strip
  end
end
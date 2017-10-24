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

  def nodes(node = root)
    ([nodes(node.left)] + [node] + [nodes(node.right)]).compact.flatten if node
  end

  def leaves(node = root)
    ([leaves(node.left)] + [node.leaf? ? node : nil] + [leaves(node.right)]).compact.flatten if node
  end

  def find(data, node = root)
    if node.nil?
      return
    elsif node.data == data
      return node
    else
      left = find(data, node.left)
      return left if left
      right = find(data, node.right)
      return right if right
    end
  end

  def include?(data, node = root)
    find(data) ? true : false
  end

  def to_s
    self.root.to_s.squeeze(" ").strip
  end
end
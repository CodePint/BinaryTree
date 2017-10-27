class BinaryTree
  attr_accessor :root

  include Enumerable

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

  alias :nodes :entries

  def leaves(node = root)
    select { |node| node.leaf? }
  end

  def each(node = root, &block)
    if node
      each(node.left, &block)
      block.call(node)
      each(node.right, &block)
    end
  end

  def to_s
    self.root.to_s.squeeze(" ").strip
  end
end
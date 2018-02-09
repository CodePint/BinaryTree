require 'pry'
require './node'

class BinaryTree
  attr_accessor :root
  def insert(new_node, node = root)
    if root.nil?  # if root (first node in tree) does not exist
      self.root = new_node #assign the new_node to root instance variable

    elsif node.nil? #first statement doesnt fire and node = nil
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

  def nodes(current_node = self.root)
    all_nodes = []
    if current_node.left
      all_nodes = all_nodes + nodes(current_node.left)
    end
    all_nodes << current_node
    if current_node.right
      all_nodes = all_nodes + nodes(current_node.right)
    end
    all_nodes
  end


  def leaves

  def each(&block)
    left.each(&block) if left
    block.call(self)
    right.each(&block) if right
  end


  #def to_s
   #self.root.to_s.squeeze(" ").strip
  #end
end

@tree = BinaryTree.new

%w(Dan Barry Ted Daniel Alice Andy Sally).each do |name|
@tree.insert(Node.new(name))
end

puts @tree.nodes
@tree = @tree.nodes
puts @tree.length
puts @tree.map(&:data)




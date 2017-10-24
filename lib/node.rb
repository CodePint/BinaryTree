class Node
  attr_accessor :data, :left, :right

  def initialize(data)
    @data = data
  end

  def leaf?
    @left.nil? && @right.nil?
  end

  include Comparable

  def <=>(node)
    data <=> node.data
  end

  def to_s
    [left, data, right].join(" ")
  end
end
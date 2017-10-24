require 'minitest/autorun'
require './lib/binary_tree'
require './lib/node'

describe BinaryTree do

  before do
    @tree = BinaryTree.new
  end

  describe "insert" do
    before do
      %w(Dan Barry Ted Daniel Alice Andy Sally).each do |name|
        @tree.insert(Node.new(name))
      end
    end

    it "should insert nodes in alphabetical order" do
      @tree.root.data.must_equal("Dan")
      @tree.root.left.data.must_equal("Barry")
      @tree.root.right.data.must_equal("Ted")
      @tree.root.right.left.data.must_equal("Daniel")
      @tree.root.left.left.data.must_equal("Alice")
      @tree.root.left.left.right.data.must_equal("Andy")
      @tree.root.right.left.right.data.must_equal("Sally")
    end

    describe "next steps..." do
      before do
        skip "TODO attempt these next tests yourself...!"
      end

      describe "nodes" do
        it "should find all the nodes" do
          @tree.nodes.length.must_equal(7)
          @tree.nodes.map(&:data).must_equal %w(Dan Barry Ted Daniel Alice Andy Sally)
        end
      end

      describe "leaves" do
        it "should find the nodes with no left or right value" do
          @tree.leaves.length.must_equal(2)
          @tree.leaves.map(&:data).must_equal %w(Alice Sally)
        end
      end

      describe "include?" do
        it "should find a Node by name" do
          @tree.include?('Sally').must_equal true
          @tree.include?('Brian').must_equal false
        end
      end

      describe "find" do
        it "should return the node with a given name" do
          @tree.find("Ted").wont_equal nil
          @tree.find("Ted").left.data.must_equal("Daniel")
          @tree.find("Ted").left.right.data.must_equal("Sally")
        end
      end

      describe "delete" do
        before do
          @tree.delete("Ted")
        end

        it "should remove a node" do
          @tree.include?('Ted').must_equal false
        end

        it "should replace the node with its left child" do
          @tree.root.right.data.must_equal("Daniel")
          @tree.root.right.right.data.must_equal("Sally")
        end
      end
    end
  end
end
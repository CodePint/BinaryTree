require 'spec_helper'

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
      @tree.root.data.should eq("Dan")
      @tree.root.left.data.should eq("Barry")
      @tree.root.right.data.should eq("Ted")
      @tree.root.right.left.data.should eq("Daniel")
      @tree.root.left.left.data.should eq("Alice")
      @tree.root.left.left.right.data.should eq("Andy")
      @tree.root.right.left.right.data.should eq("Sally")
    end

    context "next steps..." do
      before do
        pending "TODO attempt these next tests yourself...!"
      end

      describe "nodes" do
        it "should count the number of nodes" do
          @tree.nodes.length.should eq(7)
        end
      end

      describe "leaves" do
        it "should count the number of leaf nodes" do
          @tree.leaves.length.should eq(2)
        end
      end

      describe "include?" do
        it "should find a Node by name" do
          @tree.include?('Sally').should be_true
          @tree.include?('Brian').should be_false
        end
      end

      describe "find" do
        it "should return the node with a given name" do
          @tree.find("Ted").should_not be_nil
          @tree.find("Ted").left.data.should eq("Daniel")
          @tree.find("Ted").left.right.data.should eq("Sally")
        end
      end

      describe "delete" do
        before do
          @tree.delete("Ted")
        end

        it "should remove a node" do
          @tree.include?('Ted').should be_false
        end

        it "should replace the node with its left child" do
          @tree.root.right.data.should eq("Daniel")
          @tree.root.right.right.data.should eq("Sally")
        end
      end
    end
  end
end
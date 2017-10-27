require_relative 'spec_helper'

class MiniTest::Spec
    i_suck_and_my_tests_are_order_dependent!
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

      it "inserts nodes in alphabetical order" do
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
          # skip "TODO attempt these next tests yourself...!"
        end

        describe "1. nodes" do
          it "finds all the nodes" do
            @tree.nodes.length.must_equal(7)
            @tree.map(&:data).must_equal %w(Alice Andy Barry Dan Daniel Sally Ted)
          end
        end

        describe "2. leaves" do
          it "finds the nodes with no left or right value" do
            @tree.leaves.length.must_equal(2)
            @tree.leaves.map(&:data).must_equal %w(Andy Sally)
          end
        end

        describe "3. include?" do
          it "finds a Node by it's data" do
            @tree.include?(Node.new('Sally')).must_equal true
            @tree.include?(Node.new('Brian')).must_equal false
          end
        end

        describe "4. find" do
          it "returns the first node matching the block" do
            ted = @tree.find { |node| node.data.start_with? "T" }
            ted.wont_equal nil
            ted.left.data.must_equal("Daniel")
            ted.left.right.data.must_equal("Sally")
          end
        end

        describe "5. find_all" do
          it "returns nodes having data of length greater than 3" do
            nodes = @tree.find_all { |node| node.data.length > 3 }
            nodes.map(&:data).must_equal ["Alice", "Andy", "Barry", "Daniel", "Sally"]
          end

          it "returns nodes having exactly two children" do
            nodes = @tree.find_all { |node| node.left && node.right }
            nodes.map(&:data).must_equal ["Dan"]
          end

          it "returns nodes ending in y" do
            nodes = @tree.find_all { |node| node.data =~ /y$/ }
            nodes.map(&:data).must_equal ["Andy", "Barry", "Sally"]
          end
        end

      end
    end
  end
end
# https://codility.com/demo/take-sample-test/tree_height

Tree = Struct.new(:x, :l, :r)

def tree_height(tree)
  left_height = right_height = 0

  left_height = 1 + tree_height(tree.l) if tree.l
  right_height = 1 + tree_height(tree.r) if tree.r

  [left_height, right_height].max
end

# alternative solution (more complicated, but I would like to keep
# it as a reference for depth first search)
#
# State = Struct.new(:tree, :height)
#
# def tree_height(tree)
#   stack = []
#   max_height = 0
#
#   # traversing the tree using depth first search
#   stack << State.new(tree, 0)
#   while stack.any?
#     state = stack.pop
#     current_tree = state.tree
#     max_height = [max_height, state.height].max
#     stack << State.new(current_tree.l, state.height + 1) if current_tree.l
#     stack << State.new(current_tree.r, state.height + 1) if current_tree.r
#   end
#
#   max_height
# end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    d = Tree.new(:d, nil, nil)
    e = Tree.new(:e, nil, nil)
    f = Tree.new(:f, nil, nil)
    b = Tree.new(:b, d, e)
    c = Tree.new(:c, f, nil)
    a = Tree.new(:a, b, c)

    assert_equal 2, tree_height(a)
  end

  def test_empty_tree
    tree = Tree.new(:tree, nil, nil)

    assert_equal 0, tree_height(tree)
  end

  def test_balanced
    h = Tree.new(:h, nil, nil)
    i = Tree.new(:i, nil, nil)
    j = Tree.new(:j, nil, nil)
    d = Tree.new(:d, nil, nil)
    e = Tree.new(:e, nil, h)
    f = Tree.new(:f, nil, i)
    g = Tree.new(:g, nil, j)
    b = Tree.new(:b, d, e)
    c = Tree.new(:c, f, g)
    a = Tree.new(:a, b, c)

    assert_equal 3, tree_height(a)
  end
end

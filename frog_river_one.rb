def frog_river_one(x, a)
  fallen_leaves = {}

  a.each_with_index do |leaf, i|
    fallen_leaves[leaf] = true
    return i if fallen_leaves.size == x
  end

  -1
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 6, frog_river_one(5, [1, 3, 1, 4, 2, 3, 5, 4])
  end

  def test_not_possible
    assert_equal -1, frog_river_one(5, [1, 2, 1, 2, 1, 4, 5])
  end

  def test_immediately
    assert_equal 0, frog_river_one(1, [1, 1])
  end
end

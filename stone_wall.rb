def stone_wall(h)
  stack = []
  blocks = 0
  stack_height = 0

  h.each do |height|
    next if height == stack_height
    while stack_height > height
      stack_height -= stack.pop
    end
    if stack_height < height
      blocks += 1
      stack << height - stack_height
      stack_height += stack.last
    end
  end

  blocks
end

# nicer ruby solution from http://blog.codility.com/2012/06/sigma-2012-codility-programming.html
#
# def stone_wall(a)
#   stack = []
#   stones = 0
#
#   a.each do |height|
#     while stack.any? and stack.last > height
#       stack.pop
#     end
#     if stack.any? and stack.last == height
#       next
#     end
#     stones += 1
#     stack << height
#   end
#
#   stones
# end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_one_block
    assert_equal 1, stone_wall([2, 2])
  end

  def test_two_blocks
    assert_equal 2, stone_wall([1, 2, 1])
  end

  def test_three_blocks
    assert_equal 3, stone_wall([2, 1, 2, 1])
  end

  def test_three_blocks_2
    assert_equal 3, stone_wall([2, 3, 2, 1])
  end

  def test_example_input
    assert_equal 7, stone_wall([8, 8, 5, 7, 9, 8, 7, 4, 8])
  end
end

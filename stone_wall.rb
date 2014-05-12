def stone_wall(a)
  stack = [0]
  stones = 0
  prev_height = 0

  a.each do |height|
    if height > prev_height
      stack << height - prev_height
      stones += 1
    elsif height < prev_height
      while height < prev_height do
        prev_height -= stack.pop
      end
      if height > prev_height
        stones += 1
        stack << height - prev_height
      end
    end
    prev_height = height
  end

  stones
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
  def test_one_height
    assert_equal 1, stone_wall([1])
  end

  def test_one_block
    assert_equal 1, stone_wall([1, 1])
  end

  def test_two_blocks
    assert_equal 2, stone_wall([1, 2, 1])
  end

  def test_three_blocks
    assert_equal 3, stone_wall([2, 1, 2, 1])
  end

  def test_example_input
    assert_equal 7, stone_wall([8, 8, 5, 7, 9, 8, 7, 4, 8])
  end
end

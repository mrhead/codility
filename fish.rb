def fish(a, b)
  stack = []
  survivors = 0

  a.each_index do |i|
    if b[i] == 1
      stack << a[i]
      next
    end
    while stack.any? && a[i] > stack.last
      stack.pop
    end
    survivors += 1 if stack.empty?
  end

  stack.size + survivors
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_one_fish_downstream
    assert_equal 1, fish([1], [1])
  end

  def test_one_fish_upstream
    assert_equal 1, fish([1], [0])
  end

  def test_example_input
    assert_equal 2, fish([4, 3, 2, 1, 5], [0, 1, 0, 0, 0])
  end

  def test_simple
    assert_equal 1, fish([8, 6, 5, 3, 2, 4, 7], [1, 1, 1, 1, 1, 0, 0])
  end
end

def min_abs_sum_of_two(a)
  n = a.size
  back = 0
  front = n - 1
  min = abs_sum(a[back], a[front])
  a.sort!

  while back != front && min > 0
    min = min_abs_sum(a[back], a[front], min)
    if abs_sum(a[back+1], a[front]) < abs_sum(a[back], a[front-1])
      back += 1
      next
    else
      front -= 1
      next
    end
  end
  min = min_abs_sum(a[back], a[front], min)

  min
end

def abs_sum(a, b)
  (a + b).abs
end

def min_abs_sum(a, b, min)
  if abs_sum(a, b) < min
    abs_sum(a, b)
  else
    min
  end
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 1, min_abs_sum_of_two([1, 4, -3])
  end

  def test_example_input_2
    assert_equal 3, min_abs_sum_of_two([-8, 4, 5, -10, 3])
  end

  def test_zero
    assert_equal 0, min_abs_sum_of_two([0])
  end

  def test_zero_2
    assert_equal 0, min_abs_sum_of_two([-10, 100, -1000, 100, 10])
  end

  def test_positive_small
    assert_equal 6, min_abs_sum_of_two([8, 5, 3, 4, 6, 8])
  end

  def test_extreme_double
    assert_equal 0, min_abs_sum_of_two([-1000000000, 1000000000])
  end

  def test_negative_small
    assert_equal 8, min_abs_sum_of_two([-8, -5, -4, -10, -12, -18])
  end
end

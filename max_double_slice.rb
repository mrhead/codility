def max_double_slice(a)
  a[0] = 0
  a[-1] = 0

  max_from_left = []
  max_ending = 0
  a.each do |v|
    max_ending = [0, max_ending + v].max
    max_from_left << max_ending
  end

  max_from_right = []
  max_ending = 0
  a.reverse.each do |v|
    max_ending = [0, max_ending + v].max
    max_from_right << max_ending
  end
  max_from_right.reverse!

  n = a.size
  max_double_slice = 0
  for i in 1..n-2
    max_double_slice = [max_double_slice, max_from_left[i - 1] + max_from_right[i + 1]].max
  end

  max_double_slice
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 17, max_double_slice([3, 2, 6, -1, 4, 5, -1, 2])
  end

  def test_negative_numbers
    assert_equal 0, max_double_slice([-1, -1, -1, -10, -4])
  end

  def test_three_values
    assert_equal 0, max_double_slice([10, 20, 30])
  end
end

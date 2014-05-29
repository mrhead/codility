def tape_equilibrium(a)
  n = a.size
  left_sum = 0
  right_sum = a.inject(:+)
  min = 1 / 0.0

  a.each_index do |i|
    break if i == n - 1
    left_sum += a[i]
    right_sum -= a[i]
    abs = (left_sum - right_sum).abs
    min = [min, abs].min
  end
  min
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 1, tape_equilibrium([3, 1, 2, 4, 3])
  end

  def test_two_elements
    assert_equal 0, tape_equilibrium([10, 10])
  end

  def test_all_negative
    assert_equal 0, tape_equilibrium([-10, -10])
  end

  def test_one_negative
    assert_equal 20, tape_equilibrium([-10, 10])
  end
end

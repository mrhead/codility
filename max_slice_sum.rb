def max_slice_sum(a)
  max_ending = max_slice = 0
  max = nil

  a.each do |value|
    max = value if max.nil?
    max = value > max ? value : max
    max_ending = max_ending + value > 0 ? max_ending + value : 0
    max_slice = max_slice > max_ending ? max_slice : max_ending
  end

  max_slice == 0 ? max : max_slice
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 5, max_slice_sum([3, 2, -6, 4, 0])
  end

  def test_negative_values
    assert_equal(-3, max_slice_sum([-5, -4, -3, -10]))
  end

  def test_max_zero
    assert_equal 0, max_slice_sum([-1, -5, 0])
  end
end

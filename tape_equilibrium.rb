def tape_equilibrium(array)
  p = 0
  minimum = nil
  total_sum = array.inject(:+)
  sum_left = 0
  sum_right = total_sum

  begin
    sum_left += array[p]
    sum_right -= array[p]
    diff = (sum_left - sum_right).abs
    if minimum.nil? || diff < minimum
      minimum = diff
    end
    p += 1
  end while p + 1 < array.size
  minimum
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 1, tape_equilibrium([3, 1, 2, 4, 3])
  end

  def test_max_range
    assert_equal 2000, tape_equilibrium([-1000,1000])
  end

  def test_negative_values
    assert_equal 2, tape_equilibrium([-5, -3, -8, -2])
  end
end

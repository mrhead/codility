# based on: http://stackoverflow.com/questions/20660989/max-double-slice-sum/20661624#20661624
# solved with banging my head against the wall
def max_double_slice(a)
  max_double_slice = 0
  max_sum_ending_at = []
  max_sum_starting_from = []

  a[0] = a[-1] = 0

  max_sum_ending_at = max_sum_ending_at_for(a)
  max_sum_starting_from = max_sum_ending_at_for(a.reverse).reverse

  for i in 1..(a.size-2)
    current_double_slice = max_sum_ending_at[i-1] + max_sum_starting_from[i+1]
    max_double_slice = current_double_slice if current_double_slice > max_double_slice
  end
  max_double_slice
end

def max_sum_ending_at_for(array)
  max_ending = 0
  array.each_with_index.map do |v, i|
    max_ending = 0 > max_ending + v ? 0 : max_ending + v
  end
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 17, max_double_slice([3, 2, 6, -1, 4, 5, -1, 2])
  end

  def test_successive_negative_numbers
    assert_equal 1, max_double_slice([0, 1, -10, -10, -100, 1, 9])
  end
end

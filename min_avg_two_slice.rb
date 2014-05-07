def min_avg_two_slice(a)
  prefix_sums = Array.new(a.size + 1, 0)
  a.each_with_index do |value, i|
    prefix_sums[i+1] = value + prefix_sums[i]
  end

  min_index = 0
  min_average = nil
  prefix_sums.each_with_index do |prefix_sum, index|
    [2, 3].each do |slice_size|
      next if index < slice_size

      slice_average = (prefix_sum - prefix_sums[index-slice_size])/slice_size.to_f
      min_average = slice_average if min_average.nil?

      if slice_average < min_average
        min_index = index - slice_size
        min_average = slice_average
      end
    end
  end

  min_index
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 1, min_avg_two_slice([4, 2, 2, 5, 1, 5, 8])
  end

  def test_first_index
    assert_equal 0, min_avg_two_slice([1, 1])
  end

  def test_first_minimal_index
    assert_equal 1, min_avg_two_slice([2, 1, 1, 1])
  end

  def test_slice_length_3
    assert_equal 1, min_avg_two_slice([2, 1, 2, 1])
  end
end

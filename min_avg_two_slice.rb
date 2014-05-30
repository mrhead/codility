def min_avg_two_slice(a)
  min_avg = 1 / 0.0
  min_index = 0

  a.each_cons(2).each_with_index do |double, i|
    avg = double.inject(:+) / 2.0

    if avg < min_avg
      min_index = i
      min_avg = avg
    end
  end

  a.each_cons(3).each_with_index do |triple, i|
    avg = triple.inject(:+) / 3.0

    if avg < min_avg
      min_index = i
      min_avg = avg
    end
  end

  min_index
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 1, min_avg_two_slice([4, 2, 2, 5, 1, 5, 8])
  end

  def test_slice_of_three
    assert_equal 1, min_avg_two_slice([2, 1, 2, 1])
  end

  def test_negative
    assert_equal 4, min_avg_two_slice([1, 1, 0, 0, -5, -5, 1, 1])
  end
end

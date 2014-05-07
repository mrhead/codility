def max_product_of_three(a)
  a.sort!

  two_negatives = a[0] * a[1] * a.last
  biggest_numbers = a.last(3).inject(:*)

  return two_negatives if two_negatives > biggest_numbers
  biggest_numbers
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 60, max_product_of_three([-3, 1, 2, -2, 5, 6])
  end

  def test_negative_values
    assert_equal 1000, max_product_of_three([-10, -10, 1, 10])
  end
end

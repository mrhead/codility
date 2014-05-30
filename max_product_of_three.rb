def max_product_of_three(a)
  a.sort!

  # three biggest numbers
  tmp1 = a.last(3).inject(:*)

  # two smallest negative numbers and biggest positive number
  tmp2 = a[0] * a[1] * a[-1]

  [tmp1, tmp2].max
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 60, max_product_of_three([-3, 1, 2, -2, 5, 6])
  end

  def test_negative
    assert_equal 30, max_product_of_three([-1, -10, 2, 3])
  end

  def test_all_negative
    assert_equal -1, max_product_of_three([-1, -1, -1, -2])
  end

  def test_zero
    assert_equal 0, max_product_of_three([-1, -1, -1, 0])
  end
end

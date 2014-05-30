def count_div(a, b, k)
  tmp = b / k - a / k
  return tmp + 1 if a % k == 0
  tmp
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 3, count_div(6, 11, 2)
    assert_equal 4, count_div(0, 10, 3)
    assert_equal 6, count_div(5, 10, 1)
  end
end

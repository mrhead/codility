def count_div(a, b, k)
  return b/k + 1 if a == 0
  b/k - (a-1)/k
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 3, count_div(6, 11, 2)
  end

  def test_zero_a
    assert_equal 1, count_div(0, 1, 11)
  end
end

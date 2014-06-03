def max_profit(a)
  max_profit = 0
  min_price = 1 / 0.0

  a.each do |v|
    min_price = [min_price, v].min
    max_profit = [max_profit, v - min_price].max
  end

  max_profit
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 356, max_profit([23171, 21011, 21123, 21366, 21013, 21367])
  end

  def test_no_profit
    assert_equal 0, max_profit([10, 5, 1])
  end
end

def max_profit(a)
  min_price = a[0]
  a = a.drop(1)
  max_profit = 0

  a.each do |price|
    if price < min_price
      min_price = price
      next
    end
    profit = price - min_price
    max_profit = profit if profit > max_profit
  end

  max_profit
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 356, max_profit([23171, 21011, 21123, 21366, 21013, 21367])
  end

  def test_no_profit
    assert_equal 0, max_profit([100, 1])
  end
end

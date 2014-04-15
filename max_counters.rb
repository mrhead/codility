def max_counters(n, a)
  counters = Array.new(n, 0)

  max = 0
  last_set_max = 0

  a.each do |counter|
    if counter <= n
      current_counter = counters[counter-1] += 1
      max = max < current_counter ? current_counter : max
    else
      if last_set_max < max
        counters = Array.new(n, max)
        last_set_max = max
      end
    end
  end
  counters
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal [3, 2, 2, 4, 2], max_counters(5, [3, 4, 4, 6, 1, 4, 4])
  end

  def test_only_max_counter
    assert_equal [0, 0, 0, 0, 0], max_counters(5, [6, 6, 6])
  end
end

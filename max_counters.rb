def max_counters(n, a)
  counters = Array.new(n, 0)
  max = 0
  min = 0

  a.each do |v|
    if v <= n
      if counters[v - 1] < min + 1
        counters[v - 1] = min + 1
      else
        counters[v - 1] += 1
      end
      max = [max, counters[v - 1]].max
    else
      min = max
    end
  end

  counters.each_index do |i|
    counters[i] = min if counters[i] < min
  end
  counters
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal [3, 2, 2, 4, 2], max_counters(5, [3, 4, 4, 6, 1, 4, 4])
  end

  def test_only_max_counter
    assert_equal [0, 0, 0], max_counters(3, [4, 4, 4, 4, 4])
  end

  def test_max_at_the_end
    assert_equal [4, 4, 4], max_counters(3, [1, 1, 1, 1, 4])
  end
end

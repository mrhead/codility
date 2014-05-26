def count_distinct_slices(m, a)
  n = a.size
  count = 0
  front = 0
  seen = {}

  n.times do |back|
    while front < n && seen[a[front]] == nil
      seen[a[front]] = true
      front += 1
      count += seen.size
      return 1_000_000_000 if count >= 1_000_000_000
    end
    seen.delete(a[back])
  end

  count
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 9, count_distinct_slices(6, [3, 4, 5, 5, 2])
  end

  def test_simple_1
    assert_equal 24, count_distinct_slices(10000, [1, 3, 4, 1, 2, 1, 3, 2, 1])
  end

  def test_simple
    assert_equal 5, count_distinct_slices(100, [1, 2, 1])
  end

  def test_one
    assert_equal 1, count_distinct_slices(10, [1])
  end

  def test_one_number
    assert_equal 5, count_distinct_slices(1, [1, 1, 1, 1, 1])
  end

  def test_maximum
    assert_equal 1_000_000_000, count_distinct_slices(1_000_000, 1.upto(50000).to_a)
  end
end

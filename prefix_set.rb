# https://codility.com/demo/take-sample-test/prefix_set

def prefix_set(a)
  values_count = a.uniq.size
  seen = {}

  a.each_index do |i|
    seen[a[i]] = true
    return i if seen.size == values_count
  end
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 3, prefix_set([2, 2, 1, 0, 1])
  end

  def test_last_index
    assert_equal 4, prefix_set([1, 2, 3, 4, 5])
  end

  def test_first_index
    assert_equal 0, prefix_set([1, 1, 1, 1])
  end
end

def perm_missing_element(a)
  # value range [1..(N + 1)]
  # array size N
  n = a.size
  sorted_a = a.sort

  sorted_a.each_index do |i|
    return i+1 if sorted_a[i] != i+1
  end

  return n+1
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 4, perm_missing_element([2, 3, 1, 5])
  end

  def test_empty_array
    assert_equal 1, perm_missing_element([])
  end

  def test_one_item
    assert_equal 2, perm_missing_element([1])
  end
end

def perm_missing_element(a)
  n = a.size
  counter = Array.new(n + 1, 0)

  a.each do |v|
    counter[v - 1] += 1
  end

  counter.index { |v| v == 0 } + 1
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 4, perm_missing_element([2, 3, 1, 5])
  end

  def test_empty_array
    assert_equal 1, perm_missing_element([])
  end

  def test_one_element
    assert_equal 1, perm_missing_element([2])
  end
end

# https://codility.com/demo/take-sample-test/missing_integer

def missing_integer(a)
  seen = {}

  a.each do |number|
    seen[number] = true
  end

  max = a.max

  for i in 1..(max + 1)
    return i unless seen[i]
  end

  1
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 5, missing_integer([1, 3, 6, 4, 1, 2])
  end

  def test_all_negative
    assert_equal 1, missing_integer([-1, -10, -2, -3, -1])
  end

  def test_one_element
    assert_equal 2, missing_integer([1])
  end

  def test_one_element_2
    assert_equal 1, missing_integer([3])
  end

  def test_last_is_missing
    assert_equal 4, missing_integer([1, 2, 1, 3])
  end
end

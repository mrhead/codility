# https://codility.com/media/train/12-BinarySearch.pdf

def binary_search(a, x)
  n = a.size
  back = 0
  front = n - 1
  result = -1

  while back <= front
    middle = (back + front) / 2
    if a[middle] <= x
      back = middle + 1
      result = middle if a[middle] == x
    else
      front = middle - 1
    end
  end
  result
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 5, binary_search([12, 15, 15, 19, 24, 31, 53, 59, 60], 31)
  end

  def test_not_found
    assert_equal -1, binary_search([10, 20, 30], 15)
  end
end

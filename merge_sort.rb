# http://en.wikipedia.org/wiki/Merge_sort

def merge_sort(a)
  return a if a.size <= 1

  mid = a.size / 2

  left = a[0..mid-1]
  right = a[mid..-1]

  left = merge_sort(left)
  right = merge_sort(right)

  merge(left, right)
end

def merge(a, b)
  result = []

  while a.any? || b.any?
    if a.any? && b.any?
      if a.first <= b.first
        result << a.shift
      else
        result << b.shift
      end
    elsif a.any?
      result << a.shift
    elsif b.any?
      result << b.shift
    end
  end

  result
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_simple_array
    assert_equal [1, 2, 3, 4, 5], merge_sort([3, 5, 4, 1, 2])
  end

  def test_empty_array
    assert_equal [], merge_sort([])
  end

  def test_sorted_array
    assert_equal [1, 2, 3, 4, 5], merge_sort([1, 2, 3, 4, 5])
  end

  def test_negative_numbers
    assert_equal [-5, -3, -2, 0, 2, 4, 5], merge_sort([0, -5, 5, 2, 4, -3, -2])
  end
end

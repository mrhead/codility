def min_max_division(k, m, a)
  min = a.max
  max = a.inject(:+)

  while min <= max
    mid = (min + max) / 2
    blocks = count_blocks(mid, a)
    if count_blocks(mid, a) <= k
      max = mid - 1
      result = mid
    else
      min = mid + 1
    end
  end
  result
end

def count_blocks(large_sum, a)
  tmp = 0
  blocks = 1

  a.each do |value|
    if tmp + value <= large_sum
      tmp += value
    else
      tmp = value
      blocks += 1
    end
  end
  blocks
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 6, min_max_division(3, 5, [2, 1, 5, 1, 2, 2, 2])
  end

  def test_one_block
    assert_equal 5, min_max_division(1, 1, [1, 1, 1, 1, 1])
  end

  def test_one_item_blocks
    assert_equal 1, min_max_division(5, 1, [1, 1, 1, 1, 1])
  end

  def test_one_item_blocks_2
    assert_equal 2, min_max_division(5, 2, [1, 2, 1, 2, 1])
  end

  def test_one_item
    assert_equal 1, min_max_division(1, 1, [1])
  end

  def test_zeros
    assert_equal 0, min_max_division(3, 0, [0, 0, 0])
  end
end

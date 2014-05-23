# https://codility.com/media/train/13-CaterpillarMethod.pdf

def caterpillar_method(a, sum)
  n = a.size
  front = 0
  total = 0

  for back in (0..n - 1)
    while front < n - 1 && total + a[front] <= sum
      total += a[front]
      front += 1
    end
    return true if total == sum
    total -= a[back]
  end
  false
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal true, caterpillar_method([6, 2, 7, 4, 1, 3, 6], 12)
  end

  def test_false
    assert_equal false, caterpillar_method([1, 1, 1], 4)
  end

  def test_true
    assert_equal false, caterpillar_method([1, 1, 1, 1], 4)
  end
end

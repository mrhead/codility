# http://stackoverflow.com/questions/20886486/codility-peaks-complexity

def peaks(a)
  n = a.size
  peaks = []

  (1..n-2).each do |i|
    peaks << i if a[i-1] < a[i] && a[i] > a[i+1]
  end

  (1..n).each do |block_size|
    next if n % block_size != 0
    block = 0
    blocks = n / block_size
    ok = true
    peaks.each do |peak|
      if peak / block_size > block
        ok = false
        break
      end
      block += 1 if peak / block_size == block
    end
    ok = false if block != blocks
    return blocks if ok
  end
  0
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 3, peaks([1, 2, 3, 4, 3, 4, 1, 2, 3, 4, 6, 2])
  end
end

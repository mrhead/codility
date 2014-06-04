def peaks(a)
  n = a.size
  peaks = []

  for i in 1..n-2
    peaks << i if a[i - 1] < a[i] && a[i] > a[i + 1]
  end

  for blocks_count in n.downto(1)
    next if n % blocks_count != 0

    block_size = n / blocks_count
    current_block = 0

    peaks.each do |peak|
      if peak / block_size > current_block
        # current block does't have peak
        break
      end
      current_block += 1 if peak / block_size == current_block
    end
    return blocks_count if current_block == blocks_count
  end
  0
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 3, peaks([1, 2, 3, 4, 3, 4, 1, 2, 3, 4, 6, 2])
  end

  def test_no_peaks
    assert_equal 0, peaks([1, 2, 3, 4, 5])
  end

  def test_one_block
    assert_equal 1, peaks([1, 2, 3, 4, 3, 3, 1, 2])
  end
end

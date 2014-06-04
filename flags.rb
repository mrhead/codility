def flags(a)
  n = a.size
  peaks = []

  for i in 1..n-2
    peaks << i if a[i - 1] < a[i] && a[i] > a[i + 1]
  end

  max_placed = 0
  peaks.size.downto(1) do |flags_count|
    next if (flags_count - 1) * flags_count + 2 > n

    prev_peak = peaks[0]
    placed = 1

    peaks[1..-1].each do |peak|
      next if peak - prev_peak < flags_count

      placed += 1
      prev_peak = peak
      break if placed >= flags_count
    end

    max_placed = [max_placed, placed].max
  end
  max_placed
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 3, flags([1, 5, 3, 4, 3, 4, 1, 2, 3, 4, 6, 2])
  end

  def test_one_peak
    assert_equal 1, flags([1, 1, 2, 1, 1, 1])
  end

  def test_three_flags
    assert_equal 3, flags([1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1])
  end

  def test_no_peak
    assert_equal 0, flags([1, 1, 4, 5, 6])
  end
end

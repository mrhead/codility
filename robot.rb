# https://codility.com/media/train/3-PrefixSums.pdf

def robot(k, m, a)
  # k start position
  # m number of moves
  n = a.size
  max = 0

  prefix_sums = Array.new(n +1, 0)
  for i in 1..n
    prefix_sums[i] = prefix_sums[i - 1] + a[i - 1]
  end

  # p moves in one direction
  # p - m moves in the opposite direction
  (m + 1).times do |p|
    from = k - p < 0 ? 0 : k - p
    to = from + m - p < k ? k : from + m - p
    to = n - 1 if to > n
    collected = prefix_sums[to + 1] - prefix_sums[from]
    max = [max, collected].max
  end

  max
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 18, robot(4, 4, [2, 3, 1, 5, 1, 3, 9])
  end

  def test_starting_from_beginning
    assert_equal 12, robot(0, 4, [2, 3, 1, 5, 1, 3, 9])
  end
end

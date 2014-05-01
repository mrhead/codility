# I was not able to do this in O(N+M) by myself ;(
# But at least I learned something new when I "reimplemented":
# https://github.com/jsuchal/codility/blob/master/genomic_range_query.rb

def genomic_range_query(s, p, q)
  letters = %w{A C G T}
  n = s.size
  prefix_sums = Hash.new { |h, k| h[k] = Array.new(n + 1, 0) }

  s.chars.each_with_index do |char, i|
    letters.each do |letter|
      prefix_sums[letter][i+1] = prefix_sums[letter][i]
    end
    prefix_sums[char][i+1] = prefix_sums[char][i] + 1
  end

  p.zip(q).map do |from, to|
    letters.index do |letter|
      prefix_sums[letter][from] - prefix_sums[letter][to+1] < 0
    end + 1
  end
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal [1, 1, 2, 4], genomic_range_query('GACACCATA', [0, 0, 4, 7], [8, 2, 5, 7])
  end
end

def solution(x, a)
  seen = {}

  a.each_index do |i|
    seen[a[i]] = true
    return i if seen.size == x
  end

  -1
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 6, solution(5, [1, 3, 1, 4, 2, 3, 5, 4])
  end

  def test_never
    assert_equal(-1, solution(2, [1,1,1]))
  end
end

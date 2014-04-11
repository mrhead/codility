def solution(a)
  sorted_a = a.sort

  sorted_a.each_index do |i|
    return 0 if sorted_a[i] != i+1
  end

  return 1
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_one
    assert_equal 1, solution([4,1,3,2])
  end

  def test_example_two
    assert_equal 0, solution([4,1,3])
  end
end

# http://codility.com/demo/take-sample-test/

def equilibrium(a)
  prefix_sums = Array.new(a.size, 0)
  a.each_with_index do |v, i|
    prefix_sums[i+1] = v + prefix_sums[i]
  end

  suffix_sums = Array.new(a.size, 0)
  a.reverse.each_with_index do |v, i|
    suffix_sums[i+1] = v + suffix_sums[i]
  end
  suffix_sums.reverse!

  a.each_index do |i|
    return i if prefix_sums[i] == suffix_sums[i+1]
  end

  -1
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_no_element
    assert_equal(-1, equilibrium([]))
  end

  def test_one_element
    assert_equal 0, equilibrium([10])
  end

  def test_example_input
    assert_equal 3, equilibrium([-7, 1, 5, 2, -4, 3, 0])
  end
end

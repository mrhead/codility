# https://codility.com/demo/take-sample-test/str_symmetry_point

def str_symmetry_point(s)
  mid = s.size / 2
  left = s[0..mid-1]
  right = s[mid+1..-1] || ''

  return 0 if s.size == 1
  return -1 if s.empty? || left != right.reverse
  mid
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 3, str_symmetry_point('racecar')
  end

  def test_no_index
    assert_equal -1, str_symmetry_point('no_index')
  end

  def test_one_character
    assert_equal 0, str_symmetry_point('x')
  end

  def test_empty_string
    assert_equal -1, str_symmetry_point('')
  end
end

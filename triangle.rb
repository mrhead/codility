def triangle(a)
  a.sort!

  a.each_index do |i|
    return 0 if a.size - i < 3

    p = a[i]
    q = a[i+1]
    r = a[i+2]

    return 1 if p + q > r and p + r > q and q + r > p
  end

  0
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 1, triangle([10, 2, 5, 1, 8, 20])
  end

  def test_example_input_without_triangle
    assert_equal 0, triangle([10, 50, 5, 1])
  end
end

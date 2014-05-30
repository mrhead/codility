def triangle(a)
  a.sort.each_cons(3) do |p, q, r|
    return 1 if r < p + q
  end
  0
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 1, triangle([10, 2, 5, 1, 8, 20])
  end

  def test_example_input_2
    assert_equal 0, triangle([10, 50, 5, 1])
  end
end

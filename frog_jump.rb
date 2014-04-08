def frog_jump(x, y, d)
  d = d.to_f
  ((y-x)/d).ceil
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 3, frog_jump(10, 85, 30)
  end

  def test_equal_start_and_finish
    assert_equal 0, frog_jump(1, 1, 1)
  end
end

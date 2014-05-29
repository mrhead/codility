def frog_jmp(x, y, d)
  ((y - x) / d.to_f).ceil
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 3, frog_jmp(10, 85, 30)
  end

  def test_one_big_jump
    assert_equal 1, frog_jmp(1, 1_000_000_000, 1_000_000_000 - 1)
  end

  def test_exact_position
    assert_equal 3, frog_jmp(0, 30, 10)
  end
end

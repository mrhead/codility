def min_perimeter_rectangle(n)
  a  = Math.sqrt(n).floor

  while n % a != 0 do
    a -= 1
  end

  b = n / a

  2 * (a + b)
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 22, min_perimeter_rectangle(30)
  end

  def test_input_2
    assert_equal 28, min_perimeter_rectangle(48)
  end

  def test_square
    assert_equal 40, min_perimeter_rectangle(100)
  end

  def test_one
    assert_equal 4, min_perimeter_rectangle(1)
  end
end

def chocolates_by_numbers(n, m)
  n / gcd(n, m)
end

def gcd(a, b)
  if a % b == 0
    b
  else
    gcd(b, a % b)
  end
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 5, chocolates_by_numbers(10, 4)
  end

  def test_all_eaten
    assert_equal 3, chocolates_by_numbers(3, 4)
  end
end

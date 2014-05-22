# http://codesays.com/2014/solution-to-common-prime-divisors-by-codility/

def common_prime_divisors(a, b)
  count = 0

  a.zip(b) do |n, m|
    count += 1 if has_same_prime_divisors?(n, m)
  end
  count
end

def gcd(a, b)
  if a % b == 0
    b
  else
    gcd(b, a % b)
  end
end

def has_same_prime_divisors?(a, b)
  gcd_value = gcd(a, b)

  while a != 1
    a_gcd = gcd(a, gcd_value)
    break if a_gcd == 1
    a /= a_gcd
  end

  return false if a != 1

  while b != 1
    b_gcd = gcd(b, gcd_value)
    break if b_gcd == 1
    b /= b_gcd
  end

  b == 1
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 1, common_prime_divisors([15, 10, 3], [75, 30, 5])
  end
end

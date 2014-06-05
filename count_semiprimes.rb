def count_semiprimes(n, p, q)
  primes = primes(n)

  semi_primes_count = Array.new(n + 1, 0)
  primes.each do |prime1|
    primes.each do |prime2|
      break if prime1 * prime2 > n
      semi_primes_count[prime1 * prime2] = 1
    end
  end

  for i in 1..n
    semi_primes_count[i] += semi_primes_count[i - 1]
  end

  p.zip(q).map do |from, to|
    semi_primes_count[to] - semi_primes_count[from - 1]
  end
end

def primes(n)
  sieve = Array.new(n + 1, true)
  sieve[0] = sieve[1] = false
  i = 2
  while i * i <= n
    if sieve[i]
      k = i * i
      while k <= n
        sieve[k] = false
        k += i
      end
    end
    i += 1
  end

  primes = []
  sieve.each_with_index do |prime, i|
    primes << i if prime
  end

  primes
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal [10, 4, 0], count_semiprimes(26, [1, 4, 16], [26, 10, 20])
  end
end

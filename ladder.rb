def ladder(a, b)
  max = a.max
  fibs = fibs(max).drop(1)
  result = []
  a.each_index do |i|
    result << fibs[a[i]] % 2 ** b[i]
  end
  result
end

def fibs(n)
  fibs = Array.new(n + 2, 0)
  fibs[1] = 1
  for i in (2..n+1)
    fibs[i] = fibs[i - 1] + fibs[i - 2]
  end
  fibs
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal [5, 1, 8, 0, 1], ladder([4, 4, 5, 5, 1], [3, 2, 4, 3, 1])
  end
end

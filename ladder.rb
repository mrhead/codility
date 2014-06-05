def ladder(a, b)
  fibs = fibs(a.max)

  a.zip(b).map do |rungs, p|
    fibs[rungs + 1] & ((1 << p) - 1)
  end
end

def fibs(n)
  fibs = Array.new(n + 2, 0)
  fibs[1] = 1

  for i in 2..n+1
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

def distinct(a)
  seen = {}
  a.each { |v| seen[v] = true }
  seen.size
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 3, distinct([2, 1, 1, 2, 3, 1])
  end
end

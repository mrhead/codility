def abs_distinct(a)
  absolutes = {}

  a.each do |v|
    absolutes[v.abs] = true
  end

  absolutes.size
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 5, abs_distinct([-5, -3, -1, 0, 3, 6])
  end
end

def passing_cars(a)
  n = a.size
  passing_cars = 0

  suffix_sums = Array.new(n + 1, 0)

  a.reverse.each_with_index do |v, i|
    suffix_sums[i + 1] = suffix_sums[i] + v
  end
  suffix_sums.reverse!

  a.each_with_index do |car, i|
    if car == 0
      passing_cars += suffix_sums[i]
    end
  end

  passing_cars > 1_000_000_000 ? -1 : passing_cars
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 5, passing_cars([0, 1, 0, 1, 1])
  end

  def test_no_passing_cars
    assert_equal 0, passing_cars([1, 1, 1, 0, 0, 0])
  end

  def test_all_passing
    assert_equal 9, passing_cars([0, 0, 0, 1, 1, 1])
  end

  def test_a_lot_of_passing_cars
    assert_equal -1, passing_cars(Array.new(100_000, 0) + Array.new(10_001, 1))
  end
end

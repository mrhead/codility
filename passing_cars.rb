def passing_cars(a)
  passing_cars = 0
  max_passing_cars = 1000000000
  suffix_sums = []
  n = a.size

  a.each_index do |i|
    index = n - i - 1
    prev = suffix_sums[index+1].nil? ? 0 : suffix_sums[index+1]
    suffix_sums[index] = a[index] + prev
  end

  a.each_index do |i|
    passing_cars += suffix_sums[i] if a[i] == 0
    return -1 if passing_cars > max_passing_cars
  end

  passing_cars
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_one_passing_car
    assert_equal 1, passing_cars([0, 1])
  end

  def test_no_passing_car
    assert_equal 0, passing_cars([1])
  end

  def test_example_input
    assert_equal 5, passing_cars([0, 1, 0, 1, 1])
  end

  def test_bilion_passing_cars
    cars = Array.new(10000, 0) + Array.new(100000, 1)
    assert_equal 1000000000, passing_cars(cars)
  end

  def test_more_than_bilion_passing_cars
    cars = Array.new(10001, 0) + Array.new(100000, 1)
    assert_equal -1, passing_cars(cars)
  end
end

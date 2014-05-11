# from https://github.com/jsuchal/codility/blob/master/beta2010.rb

def number_of_disc_intersections(a)
  changes = Hash.new { |h, k| h[k] = { start: 0, end: 0 } }

  a.each_with_index do |radius, position|
    changes[position - radius][:start] += 1
    changes[position + radius][:end] += 1
  end

  sorted_changes = Hash[changes.sort]

  intersections = 0
  active = 0

  sorted_changes.each do |_, change|
    started = change[:start]
    ended = change[:end]
    intersections += started * active + (started * (started - 1)) / 2
    active += started - ended
    return -1 if intersections > 10_000_000
  end

  intersections
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 11, number_of_disc_intersections([1, 5, 2, 1, 4, 0])
  end

  def test_max_intersections
    assert_equal -1, number_of_disc_intersections(Array.new(5000, 5000))
  end
end

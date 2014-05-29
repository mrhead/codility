# http://blog.codility.com/2013/07/omega-2013-codility-programming.html
# rings and disks

def rings_and_disks(a, b)
  count = 0

  # transform well
  a.each_index do |i|
    next if i == 0
    a[i] = a[i - 1] < a[i] ? a[i - 1] : a[i]
  end

  # place disks
  b.each do |disk|
    while a.any?
      ring = a.pop
      if disk <= ring
        count += 1
        break
      end
    end
  end
  count
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 4, rings_and_disks([5, 6, 4, 3, 6, 2, 3], [2, 3, 5, 2, 4])
  end

  def test_small_rings
    assert_equal 0, rings_and_disks([1, 2, 3], [5, 1, 1])
  end

  def test_all_rings
    assert_equal 5, rings_and_disks([5, 4, 3, 2, 1], [1, 2, 3, 4, 5])
  end
end

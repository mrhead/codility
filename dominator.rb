def dominator(a)
  size = 0
  leader_candidate = nil

  a.each do |item|
    if size == 0
      leader_candidate = item
      size += 1
    else
      if leader_candidate != item
        size -= 1
      else
        size += 1
      end
    end
  end

  count = a.select { |v| v == leader_candidate }.size

  return -1 if count <= a.size / 2

  a.index { |v| v == leader_candidate }
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 0, dominator([3, 4, 3, 2, 3, -1, 3, 3])
  end

  def test_non_leader_candidate
    assert_equal(-1, dominator([1, 1, 2, 3]))
  end
end

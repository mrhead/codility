def equi_leader(a)
  size = 0
  leader = nil
  equi_leaders = 0

  a.each do |item|
    if size == 0
      leader = item
      size += 1
    else
      if leader != item
        size -= 1
      else
        size += 1
      end
    end
  end

  total_leaders = a.select { |v| v == leader }.size

  return 0 if total_leaders <= a.size / 2

  leader_count = 0
  a.each_with_index do |value, i|
    if value == leader
      leader_count += 1
    end
    leaders_in_right_part = total_leaders - leader_count
    if leader_count > (i + 1) / 2 && leaders_in_right_part > (a.size - i - 1) / 2
      equi_leaders += 1
    end
  end

  equi_leaders
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 2, equi_leader([4, 3, 4, 4, 4, 2])
  end
end

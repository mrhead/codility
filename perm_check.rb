def perm_check(a)
  seen = {}

  max = a.max
  a.each do |v|
    seen[v] = true
  end

  seen.size == max && max == a.size ? 1 : 0

  # alternative solution
  #
  # seen = {}
  #
  # a.each do |v|
  #   seen[v] = true
  # end
  #
  # a.size.times do |n|
  #   return 0 if seen[n+1].nil?
  # end
  # 1
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 1, perm_check([4, 1, 3, 2])
  end

  def test_no_perm
    assert_equal 0, perm_check([4, 1, 3])
  end

  def test_same_numbers
    assert_equal 0, perm_check([1, 1, 2])
  end
end

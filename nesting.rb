def nesting(s)
  stack = []

  s.chars.each do |char|
    if char == '('
      stack << char
    else
      return 0 if stack.pop != '('
    end
  end

  stack.empty? ? 1 : 0
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 1, nesting('(()(())())')
  end

  def test_example_fail
    assert_equal 0, nesting('())')
  end

  def test_empty
    assert_equal 1, nesting('')
  end

  def test_success
    assert_equal 1, nesting('()()')
  end

  def test_not_closed
    assert_equal 0, nesting('(())(')
  end
end

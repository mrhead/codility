def brackets(s)
  pairs = {
    '{' => '}',
    '[' => ']',
    '(' => ')'
  }

  stack = []

  s.chars.each do |char|
    if pairs.keys.include?(char)
      stack << char
    else
      return 0 if pairs[stack.pop] != char
    end
  end

  return 0 if stack.any?
  1
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 1, brackets('{[()()]}')
  end

  def test_not_properly_nested
    assert_equal 0, brackets('([)()]')
  end

  def test_not_closed
    assert_equal 0, brackets('([()]){')
  end

  def test_empty_string
    assert_equal 1, brackets('')
  end

  def test_not_opened
    assert_equal 0, brackets(')()')
  end
end

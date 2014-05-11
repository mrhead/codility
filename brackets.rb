def brackets(s)
  stack = []

  s.chars.each do |c|
    return 0 if c =~ /[}\]\)]/ && stack.pop != c

    stack.push('}') if c == '{'
    stack.push(']') if c == '['
    stack.push(')') if c == '('
  end

  stack.empty? ? 1 : 0
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input_nested
    assert_equal 1, brackets('{[()()]}')
  end

  def test_example_input_not_nested
    assert_equal 0, brackets('([)()]')
  end

  def test_not_closed
    assert_equal 0, brackets('(')
  end
end

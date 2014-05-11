def nesting(s)
  opened = 0

  s.chars.each do |c|
    if c == '('
      opened += 1
    else
      return 0 if opened == 0
      opened -= 1
    end
  end

  opened == 0 ? 1 : 0
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 1, nesting('(()(())())')
  end

  def test_unopened
    assert_equal 0, nesting('))')
  end

  def test_unclosed
    assert_equal 0, nesting('((')
  end
end

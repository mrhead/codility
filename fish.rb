# http://codereview.stackexchange.com/questions/33716/fish-food-chain-on/34081#34081
def fish(a, b)
  survivors = 0
  flowing_up = []

  a.zip(b).each do |size, direction|
    if direction == 0
      if flowing_up.empty?
        survivors += 1
      else
        while flowing_up.any?
          if size > flowing_up.last
            flowing_up.pop
          else
            break
          end
        end
        if flowing_up.empty?
          survivors += 1
        end
      end
    else
      flowing_up << size
    end
  end

  survivors + flowing_up.size
end

require 'minitest/autorun'

# this test coverage is incomplete
# you can still write passing code which is wrong
class Tests < MiniTest::Unit::TestCase
  def test_all_upstream
    assert_equal 3, fish([1, 2, 3], [0, 0, 0])
  end

  def test_all_downstream
    assert_equal 3, fish([1, 2, 3], [1, 1, 1])
  end

  def test_example_input
    assert_equal 2, fish([4, 3, 2, 1, 1], [0, 1, 0, 0, 0])
  end

  def test_one_big_at_the_end
    assert_equal 1, fish([1, 2, 3, 4, 5], [1, 1, 1, 1, 0])
  end

  def test_one_big_at_the_beggining
    assert_equal 1, fish([5, 4, 3, 2, 1], [1, 0, 0, 0, 0])
  end
end

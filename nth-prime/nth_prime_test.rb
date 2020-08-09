require 'minitest/autorun'
require 'minitest/focus'
require_relative 'nth_prime'

# Common test data version: 2.1.0 4a3ba76
class NthPrimeTest < Minitest::Test
  def test_first_prime
    assert_equal 2, Prime.nth(1)
  end

  def test_second_prime
    assert_equal 3, Prime.nth(2)
  end

  def test_sixth_prime
    assert_equal 13, Prime.nth(6)
  end

  def test_sixth_prime
    assert_equal 29, Prime.nth(10)
  end

  def test_big_prime
    assert_equal 7919, Prime.nth(1000)
  end

  def test_even_bigger_prime
    assert_equal 104743, Prime.nth(10001)
  end

  def test_there_is_no_zeroth_prime
    assert_raises(ArgumentError) do
      Prime.nth(0)
    end
  end

  def test_is_prime
    assert Prime.new(2).is_prime?(2)
    assert Prime.new(2).is_prime?(3)
    assert Prime.new(2).is_prime?(5)
    refute Prime.new(2).is_prime?(6)
    assert Prime.new(2).is_prime?(7)
    refute Prime.new(2).is_prime?(9)
    assert Prime.new(2).is_prime?(11)
    assert Prime.new(2).is_prime?(13)
  end
end

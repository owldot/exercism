require 'minitest/autorun'
require 'minitest/focus'
require_relative 'sum'

class SumTest < Minitest::Test
  def test_1
    nums = [2, 7, 11, 15]
    target = 9

    assert_equal [0, 1], Sum.two_sums(nums, target)
    assert_equal [0, 1], Sum.two_sums_caching(nums, target)
  end

  def test_2
    nums = [2, 7, 11, 15]
    target = 22

    assert_equal [1, 3], Sum.two_sums(nums, target)
    assert_equal [1, 3], Sum.two_sums_caching(nums, target)
  end

  def test_longer
    nums = [2, 7, 11, 15, 34, 77, 2, 7, 43, 99]
    target = 120

    assert_equal [5, 8], Sum.two_sums(nums, target)
    assert_equal [5, 8], Sum.two_sums_caching(nums, target)
  end

  def test_3_2_4
    nums = [3, 2, 4]
    target = 6

    assert_equal [1, 2], Sum.two_sums(nums, target)
    assert_equal [1, 2], Sum.two_sums_caching(nums, target)
  end

  def test_empty_result
    nums = [2, 7, 11, 15]
    target = 10

    assert_equal [], Sum.two_sums(nums, target)
    assert_equal [], Sum.two_sums_caching(nums, target)
  end

  def test_empty_result_empty_nums
    nums = []
    target = 10

    assert_equal [], Sum.two_sums(nums, target)
    assert_equal [], Sum.two_sums_caching(nums, target)
  end
end

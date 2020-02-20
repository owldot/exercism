require 'minitest/autorun'
require_relative 'matrix'

class MatrixTest < Minitest::Test
  def test_extract_a_row
    matrix = Matrix.new("1 2\n10 20")
    assert_equal [1, 2], matrix.rows[0]
  end

  def test_extract_same_row_again
    matrix = Matrix.new("9 7\n8 6")
    assert_equal [9, 7], matrix.rows[0]
  end

  def test_extract_other_row
    matrix = Matrix.new("9 8 7\n19 18 17")
    assert_equal [19, 18, 17], matrix.rows[1]
  end

  def test_extract_other_row_again
    matrix = Matrix.new("1 4 9\n16 25 36")
    assert_equal [16, 25, 36], matrix.rows[1]
  end

  def test_extract_a_column
    matrix = Matrix.new("1 2 3\n4 5 6\n7 8 9\n 8 7 6")
    assert_equal [1, 4, 7, 8], matrix.columns[0]
  end

  def test_extract_another_column
    matrix = Matrix.new("89 1903 3\n18 3 1\n9 4 800\n12 23 34\n5 45 65")
    assert_equal [89, 18, 9, 12, 5], matrix.columns[0]
    assert_equal [1903, 3, 4, 23, 45], matrix.columns[1]
    assert_equal [3, 1, 800, 34, 65], matrix.columns[2]
  end
end

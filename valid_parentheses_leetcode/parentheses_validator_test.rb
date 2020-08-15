require 'minitest/autorun'
require_relative 'parentheses_validator'

class ParenthesesValidatorTest < Minitest::Test
  def test_round_parentheses
    assert ParenthesesValidator.valid?('()')
  end

  def test_square_parentheses
    assert ParenthesesValidator.valid?('[]')
  end

  def test_brackets_parentheses
    assert ParenthesesValidator.valid?('{}')
  end

  def test_all_complex
    assert ParenthesesValidator.valid?('{[]}')
  end

  def test_all
    assert ParenthesesValidator.valid?('{}()[]')
  end

  def test_invalid_1
    refute ParenthesesValidator.valid?('(]')
  end

  def test_invalid_2
    refute ParenthesesValidator.valid?('[(])')
  end

  def test_invalid_remaining_closing
    refute ParenthesesValidator.valid?('[()])')
  end

  def test_invalid_remaining_opening
    refute ParenthesesValidator.valid?('[()](')
  end

  def test_valid_if_string_is_empty
    assert ParenthesesValidator.valid?('')
  end

  def test_invalid_if_one_bracket_only
    refute ParenthesesValidator.valid?('(')
  end

  def test_invalid_if_inclorrect_order
    refute ParenthesesValidator.valid?(')(')
  end

  def test_allow_other_character
    assert ParenthesesValidator.valid?('([a]b)')
  end
end
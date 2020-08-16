class Brackets
  class << self

    BRACKETS = {
      '{' => '}',
      '[' => ']',
      '(' => ')'
    }.freeze
    OPENING_BRACKETS = BRACKETS.keys.freeze
    CLOSING_BRACKETS = BRACKETS.values.freeze

    def paired?(string)
      testing = []
      string.chars.each do |el|
        if OPENING_BRACKETS.include?(el)
          testing.push(el)
        elsif CLOSING_BRACKETS.include?(el)
          if el == BRACKETS[testing.last]
            testing.pop
          else
            return false
          end
        end
      end

      testing.empty?
    end

  end
end
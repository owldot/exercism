class ParenthesesValidator
  OPENED_PARENTHESES = {
    '{' => '}',
    '[' => ']',
    '(' => ')'
  }.freeze

  CLOSED_PARENTHESES = {
    '}' => '{',
    ']' => '[',
    ')' => '('
  }.freeze

  class << self
    def valid?(string)
      testing = []
      string.chars.each do |char|
        if OPENED_PARENTHESES.keys.include?(char)
          testing.push char
        elsif CLOSED_PARENTHESES.keys.include?(char)
          if CLOSED_PARENTHESES[char] == testing.last
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

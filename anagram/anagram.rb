class Anagram
  def initialize(string)
    @string = string
  end

  def match(examples)
    matched = []
    examples.each do |word|
      if word.chars.map(&:downcase).sort == @string.chars.map(&:downcase).sort && word.downcase != @string.downcase
        matched << word
      end
    end

    matched
  end
end

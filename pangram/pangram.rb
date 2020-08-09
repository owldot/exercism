class Pangram
  class << self
    def pangram?(string)
      alphabet_counter = generate_empty_alphabet

      string.chars.each do |char|
        char = char.downcase
        if alphabet_counter[char].nil?
          next
        end

        alphabet_counter[char] += 1
      end

      alphabet_counter.all? { |_, v| v >= 1 }
    end

    private

    def generate_empty_alphabet
      res = {}
      ('a'..'z').each do |letter|
        res[letter] = 0
      end
      res
    end
  end
end
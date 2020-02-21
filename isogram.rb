class Isogram
  def self.isogram?(word)
    counted_chars = normalize(word).chars.reduce({}) do |counter, char|
      if counter[char].nil?
        counter[char] = 1
      else
        counter[char] += 1
      end
      counter
    end

    counted_chars.values.all? { |amount| amount == 1 }
  end

  def self.normalize(word)
    word.downcase.gsub(/[,\.\- ]/, '')
  end
end
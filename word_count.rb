class Phrase
  def initialize(sentence)
    @words = sentence.gsub(/[:,\n#!&@$%\^&\.]/, ' ').split(' ').select { |word| word != '' }
    puts "puts: #{@words} end"
  end

  def word_count
    @words.reduce({}) do |dictionary, word|
      normalised_word = normalise!(word)
      if dictionary[normalised_word].nil?
        dictionary[normalised_word] = 1
      else
        dictionary[normalised_word] = dictionary[normalised_word] + 1
      end
      dictionary
    end
  end

  private

  def normalise!(word)
    word = word.downcase

    # strip quotes
    if word[0] == "'" && word[word.length - 1] == "'"
      word[0] = word[word.length - 1] = ''
    end
    word
  end
end
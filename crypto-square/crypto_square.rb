require 'pry'

class Crypto
  def initialize(text)
    @text = text
  end

  def ciphertext
    normilized = normilize
    cols, rows = rectangle(normilized.size)

    word = ''
    array = []
    col = 0
    normilized.chars.each do |char|
      if col == cols
        array.push(word)
        word = ''
        col = 0
      end

      col += 1
      word += char
    end
    array << word.ljust(cols, ' ')
    array.map(&:chars).transpose.map(&:join).join(" ")
  end

  private

  def normilize
    @text.gsub(/[^a-zA-Z0-9]/, '').downcase
  end

  def rectangle(size)
    cols = 1
    rows = 1

    loop do
      if (cols + 1) * rows <= size
        cols += 1
      else
        break
      end

      if (rows + 1) * cols <= size
        rows += 1
      else
        break
      end
    end

    if cols * rows < size
      if cols == rows
        cols += 1
      else
        rows += 1
      end
    end

    [cols, rows]
  end
end

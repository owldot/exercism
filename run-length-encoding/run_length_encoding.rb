class RunLengthEncoding
  class << self
    def encode(input)
      return '' if input.empty?

      string_enumerator = input.chars.each

      encoded = ''
      counter = 1
      current_letter = string_enumerator.next

      loop do
        begin
          next_letter = string_enumerator.peek
        rescue StopIteration
        end

        if current_letter == next_letter
          counter += 1
          string_enumerator.next
        else
          if counter == 1
            encoded += current_letter
          else
            encoded += (counter.to_s + current_letter)
          end

          counter = 1
          current_letter = string_enumerator.next
        end
      end

      encoded
    end

    def decode(input)
      return '' if input.empty?

      string_enumerator = input.chars.each

      decoded = ''
      current_symbol = string_enumerator.next
      counter_string = ''

      loop do
        if current_symbol.digit?
          counter_string += current_symbol
        else
          if counter_string.empty?
            decoded += current_symbol
          else
            decoded += current_symbol * Integer(counter_string)
            counter_string = ''
          end
        end

        current_symbol = string_enumerator.next
      end

      decoded
    end
  end
end

class String
  def digit?
    Integer(self)
    true
  rescue ArgumentError
    false
  end
end

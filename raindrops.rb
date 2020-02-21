class Raindrops
  DICTIONARY = {
    3 => 'Pling',
    5 => 'Plang',
    7 => 'Plong'
  }.freeze

  def self.convert(number)
    result = ''

    DICTIONARY.each do |key, val|
      if number % key == 0
        result += val
      end
    end

    if result.empty?
      result = number.to_s
    end

    result
  end
end
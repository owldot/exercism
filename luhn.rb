class Luhn
  attr_reader :numbers

  def self.valid?(string)
    self.new(string).valid?
  end

  def initialize(string)
    begin
      @numbers = prepare(string)
    rescue ArgumentError
      @numbers = []
    end
  end

  def valid?
    # double every second digit,
    # starting from the right and subtract 9 if result grater than 9.
    if numbers.empty? || numbers.length == 1
      return false
    end


    checksum = numbers.reverse.map.with_index do |num, index|
      if index % 2 == 0
        num
      else
        doubled = num * 2
        if doubled > 9
          doubled - 9
        else
          doubled
        end
      end
    end.reduce(&:+)

    checksum % 10 == 0
  end

  private

  def prepare(string)
    string.gsub(/\s/, '').chars.map do |number|
      Integer(number)
    end
  end
end
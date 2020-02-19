class ResistorColorDuo
  DICTIONARY = {
    black: 0,
    brown: 1,
    red: 2,
    orange: 3,
    yellow: 4,
    green: 5,
    blue: 6,
    violet: 7,
    grey: 8,
    white: 9
  }.freeze

  def self.value(printed_colors)
    # expect to raise KeyError if color is not found
    printed_colors_symbols = Array(printed_colors).map { |val| DICTIONARY.fetch(val.downcase.to_sym) }

    printed_colors_symbols[0] * 10 + printed_colors_symbols[1]
  end
end
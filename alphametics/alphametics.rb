class Alphametics
  def self.solve(puzzle)
    Alphametics.new(puzzle).solve
  end

  def initialize(puzzle)
    @puzzle = puzzle
  end

  def letters

  end

  def answer_letters
    @puzzle.split(' == ').last.upcase.chars.uniq
  end

  def question_letters
    @puzzle.upcase.split(' == ').first.gsub(/[^A-Z]/, '').chars.uniq
  end
end

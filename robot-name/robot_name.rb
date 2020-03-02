class Robot
  DIGIT_UPPER_BOUND = 10

  attr_reader :name

  @@names_registry = []

  def initialize
    reset
  end

  class << self
    def forget
      @@names_registry = []
    end
  end

  def reset
    @@names_registry << @name = unique_name
  end

  private

  def digit
    rand DIGIT_UPPER_BOUND
  end

  def letter
    ('A'..'Z').to_a.sample
  end

  def new_name
    "#{letter}#{letter}#{digit}#{digit}#{digit}"
  end

  def unique_name
    name = new_name

    @@names_registry.include?(name) ? unique_name : name
  end
end
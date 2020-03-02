require 'securerandom'
class Robot
  @@names_registry = []

  def self.forget
    @@names_registry = []
    self.instance_variable_set(:@name, '')
  end

  attr_reader :name

  def initialize
    reset
  end

  def reset
    @name = generate_name
    @@names_registry << @name
  end

  private

  def generate_name
    letters = Array('A'..'Z')
    numbers = Array(0..9)
    name = (letters.sample(2) + numbers.sample(3)).join

    @@names_registry.include?(name) ? generate_name : name
  end
end
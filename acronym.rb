class Acronym
  def self.abbreviate(string)
    words = string.split(/\W/)
    words.map { |word| word[0] && word[0].upcase }.join
    #  alternative solution
    #  string.scan(/\b\w/).join.upcase
  end
end
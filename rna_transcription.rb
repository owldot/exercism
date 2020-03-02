class Complement
  MAPPING = {
    'G' => 'C',
    'C' => 'G',
    'T' => 'A',
    'A' => 'U'
  }.freeze

  def self.of_dna(dna)
    return '' if dna.nil? || dna.empty?

    dna.upcase.chars.map do |nucleotide|
      MAPPING[nucleotide]
    end.join
  end
end
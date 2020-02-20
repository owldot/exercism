class Hamming
  def self.compute(dna_strand_1, dna_strand_2)
    if dna_strand_1.length != dna_strand_2.length
      raise ArgumentError.new("DNA strands are different size")
    end
    mutations = 0

    dna_strand_1.chars.each_with_index do |nucleotide, index|
      if dna_strand_2[index] != nucleotide
        mutations += 1
      end
    end

    mutations
  end
end
require_relative 'high_scores'

RSpec.describe HighScores do

  let(:scores) { [30, 40, 50] }

  context '#scores' do
    it 'returns scores if array is given' do
      expect(HighScores.new(scores).scores).to eq(scores)
    end

    it 'returns scores as array if one score is given' do
      expect(HighScores.new(10).scores).to eq([10])
    end

    it 'returns empty array if no score is given' do
      expect(HighScores.new().scores).to eq([])
    end
  end

  context '#latest' do
    it 'returns latest score' do
      expect(HighScores.new(scores).latest).to eq(50)
    end
    it 'returns 0 if no score yet' do
      expect(HighScores.new().latest).to eq(0)
    end
  end
end

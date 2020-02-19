require_relative 'two_fer'
RSpec.describe TwoFer do
  it 'says me when no name is given' do
    expect(TwoFer.two_fer).to eq "One for you, one for me."
  end

  it 'says name when a name is given' do
    expect(TwoFer.two_fer('Alice')).to eq "One for Alice, one for me."
    expect(TwoFer.two_fer('Bob')).to eq "One for Bob, one for me."
  end
end
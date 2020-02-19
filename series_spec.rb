require_relative './series'

RSpec.describe Series do
  subject{ Series.new("123456")}

  it "splits by 2" do
    expect(subject.slices(2)).to eq %w(12 23 34 45 56)
  end

  it "splits by 3" do
    expect(subject.slices(3)).to eq %w(123 234 345 456)
  end

  it "splits by 5" do
    expect(subject.slices(5)).to eq %w(12345 23456)
  end

  it "splits by 6" do
    expect(subject.slices(6)).to eq %w(123456)
  end

  it 'raises error' do
    expect {subject.slices(7)}.to raise_error ArgumentError
  end
end
require_relative 'resistor_color_duo'
RSpec.describe ResistorColorDuo do
  it 'evaluates' do
    expect(ResistorColorDuo.value(["brown", "black"])).to eq 10
    expect(ResistorColorDuo.value(["blue", "grey"])).to eq 68
    expect(ResistorColorDuo.value(["orange", "orange"])).to eq 33
    expect(ResistorColorDuo.value(["green", "brown", "orange"])).to eq 51
    expect(ResistorColorDuo.value(["green", "BroWn", "orange"])).to eq 51
  end
  it 'raises error if color not found' do
    expect{ResistorColorDuo.value(["green", "lime", "orange"])}.to raise_error KeyError
  end

end
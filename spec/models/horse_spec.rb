require 'rails_helper'

RSpec.describe Horse, type: :model do
  it 'gets gate class depends on gate number' do
    horse = Horse.new(1, 2, 'キタサンブラック', '牡5 57 武豊', '1.9(1人気)')
    expect(horse.get_gate_class).to eq 'horse-table gate-number'
  end
end

require 'rails_helper'

RSpec.describe Horse, type: :model do
  it 'gets gate class depends on gate number' do
    horse = build(:horse)
    expect(horse.get_gate_class).to eq 'horse-table gate-number'
  end
end

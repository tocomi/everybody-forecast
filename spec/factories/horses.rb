FactoryBot.define do
  factory :horse do
    gate_number 1
    horse_number 2
    name 'キタサンブラック'
    age_handi_jockey '牡5 57 武豊'
    odds_and_rank '1.9(1人気)'

    initialize_with { new(gate_number, horse_number, name, age_handi_jockey, odds_and_rank) }
  end
end

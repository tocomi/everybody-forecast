class CreateForecasts < ActiveRecord::Migration[5.0]
  def change
    create_table :forecasts, primary_key: [ :race_id, :user_id ] do |t|
      t.string :race_id, null: false
      t.string :user_id, null: false
      t.integer :horse_01, default: 0
      t.integer :horse_02, default: 0
      t.integer :horse_03, default: 0
      t.integer :horse_04, default: 0
      t.integer :horse_05, default: 0
      t.integer :horse_06, default: 0
      t.integer :horse_07, default: 0
      t.integer :horse_08, default: 0
      t.integer :horse_09, default: 0
      t.integer :horse_10, default: 0
      t.integer :horse_11, default: 0
      t.integer :horse_12, default: 0
      t.integer :horse_13, default: 0
      t.integer :horse_14, default: 0
      t.integer :horse_15, default: 0
      t.integer :horse_16, default: 0
      t.integer :horse_17, default: 0
      t.integer :horse_18, default: 0

      t.timestamps
    end
  end
end

class CreateForecasts < ActiveRecord::Migration[5.0]
  def change
    create_table :forecasts, primary_key: [ :race_id, :user_id, :horse_number ] do |t|
      t.integer :race_id, null: false, limit: 8 # bigint
      t.integer :user_id, null: false
      t.integer :horse_number, null: false
      t.integer :forecast, null: false

      t.timestamps
    end
  end
end

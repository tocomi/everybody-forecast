class CreateForecasts < ActiveRecord::Migration[5.0]
  def change
    create_table :forecasts, primary_key: [ :race_id, :user_id ] do |t|
      t.string :race_id, null: false
      t.string :user_id, null: false
      t.integer :horse_number, null: false
      t.integer :forecast, null: false

      t.timestamps
    end
  end
end

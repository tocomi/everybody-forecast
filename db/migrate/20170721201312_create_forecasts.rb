class CreateForecasts < ActiveRecord::Migration[5.0]
  def change
    create_table :forecasts do |t|
      t.string :user_id
      t.bigint :race_id
      t.integer :horse_number
      t.integer :mark

      t.timestamps
    end
  end
end

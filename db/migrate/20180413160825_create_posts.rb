class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.integer :race_id, limit: 8
      t.integer :user_id
      t.text :comment

      t.timestamps
    end
    add_index :posts, :race_id
  end
end

class CreateWatchlists < ActiveRecord::Migration[5.0]
  def change
    create_table :watchlists do |t|
      t.integer :lot_id, foreign_key: true
      t.integer :user_id, foreign_key: true
      t.integer :status
      t.timestamps
    end
     add_index :watchlists, :lot_id
     add_index :watchlists, :user_id
  end
end

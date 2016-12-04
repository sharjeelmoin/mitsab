class CreateBids < ActiveRecord::Migration[5.0]
  def change
    create_table :bids do |t|
      t.integer :amount
      t.integer :user_id
      t.integer :lot_id
      t.integer :status, default: 0,     null: false

      t.timestamps
    end
  end
end

class CreateLots < ActiveRecord::Migration[5.0]
  def change
    create_table :lots do |t|
      t.integer :yard_number
      t.string :yard_name
      t.date :sale_date
      t.string :sale_time
      t.integer :item_no
      t.integer :lot_number
      t.string :vehicle_type
      t.string :year
      t.string :make
      t.string :model_group
      t.string :model_detail
      t.string :body_style
      t.string :color
      t.string :damage_description
      t.string :secondary_damage
      t.string :sale_title_state
      t.string :sale_title_type
      t.string :has_keys
      t.string :lot_cond_code
      t.string :vin
      t.integer :odometer
      t.string :odometer_brand
      t.integer :est_retail_value
      t.string :engine
      t.string :drive
      t.string :transmission
      t.string :fuel_type
      t.integer :cylinders
      t.string :runs_drives
      t.string :sale_status
      t.integer :high_bid
      t.string :special_note
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
      t.string :currency_code
      t.string :thumbnail
      t.datetime :cop_created_date
      t.string :grid_rows
      t.string :offer_eligible
      t.integer :buy_now_price
      t.integer :amount, default: 0,     null: false
      t.integer :active_status, default: 1,     null: false

      t.timestamps
    end
  end
end

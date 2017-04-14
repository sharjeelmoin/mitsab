# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170402202825) do

  create_table "bids", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "amount"
    t.integer  "user_id"
    t.integer  "lot_id"
    t.integer  "status",     default: 0, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "bulk_uploads", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "attachment"
    t.integer  "status",     default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "lots", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "yard_number"
    t.string   "yard_name"
    t.date     "sale_date"
    t.string   "sale_time"
    t.integer  "item_no"
    t.integer  "lot_number"
    t.string   "vehicle_type"
    t.string   "year"
    t.string   "make"
    t.string   "model_group"
    t.string   "model_detail"
    t.string   "body_style"
    t.string   "color"
    t.string   "damage_description"
    t.string   "secondary_damage"
    t.string   "sale_title_state"
    t.string   "sale_title_type"
    t.string   "has_keys"
    t.string   "lot_cond_code"
    t.string   "vin"
    t.integer  "odometer"
    t.string   "odometer_brand"
    t.integer  "est_retail_value"
    t.string   "engine"
    t.string   "drive"
    t.string   "transmission"
    t.string   "fuel_type"
    t.integer  "cylinders"
    t.string   "runs_drives"
    t.string   "sale_status"
    t.integer  "high_bid"
    t.string   "special_note"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "country"
    t.string   "currency_code"
    t.string   "thumbnail"
    t.datetime "cop_created_date"
    t.string   "grid_rows"
    t.string   "offer_eligible"
    t.integer  "buy_now_price"
    t.integer  "amount",             default: 0, null: false
    t.integer  "active_status",      default: 1, null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
    t.index ["name"], name: "index_roles_on_name", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "company"
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "country"
    t.string   "state"
    t.string   "city"
    t.string   "zip"
    t.string   "phone"
    t.boolean  "admin",                  default: false, null: false
    t.integer  "role",                   default: 0,     null: false
    t.string   "skype",                  default: "",    null: false
    t.string   "linkedin",               default: "",    null: false
    t.string   "twitter",                default: "",    null: false
    t.string   "bio"
    t.boolean  "blocked",                default: false, null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "users_roles", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree
  end

  create_table "watchlists", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "lot_id"
    t.integer  "user_id"
    t.integer  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lot_id"], name: "index_watchlists_on_lot_id", using: :btree
    t.index ["user_id"], name: "index_watchlists_on_user_id", using: :btree
  end

end

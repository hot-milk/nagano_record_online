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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 2019_05_12_204209) do
=======
ActiveRecord::Schema.define(version: 2019_05_12_204208) do

  create_table "order_items", force: :cascade do |t|
    t.integer "order_id"
    t.integer "product_id"
    t.integer "order_item_number"
    t.integer "order_item_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
>>>>>>> 7353540c768f79be6b5698d2534a9dc4febcc11d

  create_table "orders", force: :cascade do |t|
    t.integer "user_id"
    t.integer "payment_method"
    t.integer "ship_status"
    t.integer "total_price"
    t.string "order_ship_last_name"
    t.string "order_ship_first_name"
    t.string "order_ship_ruby_last_name"
    t.string "order_ship_ruby_first_name"
    t.string "order_ship_post_code"
    t.string "order_ship_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "user_id"
    t.integer "product_id"
    t.text "review_content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shipments", force: :cascade do |t|
    t.integer "user_id"
    t.string "ship_last_name"
    t.string "ship_first_name"
    t.string "ship_ruby_last_name"
    t.string "ship_ruby_first_name"
    t.string "ship_postcode"
    t.string "ship_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "last_name"
    t.string "first_name"
    t.string "ruby_last_name"
    t.string "ruby_first_name"
    t.string "postcode"
    t.string "address"
    t.string "phone"
    t.string "email"
    t.string "password"
    t.boolean "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
  end

end
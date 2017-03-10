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

ActiveRecord::Schema.define(version: 20170310131448) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachinary_files", force: :cascade do |t|
    t.string   "attachinariable_type"
    t.integer  "attachinariable_id"
    t.string   "scope"
    t.string   "public_id"
    t.string   "version"
    t.integer  "width"
    t.integer  "height"
    t.string   "format"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent", using: :btree
  end

  create_table "customer_addresses", force: :cascade do |t|
    t.integer  "customer_id"
    t.string   "address"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["customer_id"], name: "index_customer_addresses_on_customer_id", using: :btree
  end

  create_table "customers", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "phone_number"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["user_id"], name: "index_customers_on_user_id", using: :btree
  end

  create_table "drivers", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "phone_number"
    t.string   "address"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "status"
    t.string   "verification_status", default: "unverified"
    t.string   "verification_code"
    t.index ["user_id"], name: "index_drivers_on_user_id", using: :btree
  end

  create_table "order_products", force: :cascade do |t|
    t.integer  "quantity"
    t.integer  "product_id"
    t.integer  "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_products_on_order_id", using: :btree
    t.index ["product_id"], name: "index_order_products_on_product_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.string   "aasm_state",                            default: "unpaid"
    t.date     "delivery_date"
    t.datetime "delivered_at"
    t.decimal  "subtotal",      precision: 8, scale: 2
    t.integer  "customer_id"
    t.integer  "driver_id"
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
    t.integer  "amount_cents",                          default: 0,        null: false
    t.json     "payment"
    t.index ["customer_id"], name: "index_orders_on_customer_id", using: :btree
    t.index ["driver_id"], name: "index_orders_on_driver_id", using: :btree
  end

  create_table "prescriptions", force: :cascade do |t|
    t.integer  "customer_id"
    t.string   "number"
    t.string   "interval"
    t.datetime "delivery_date"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["customer_id"], name: "index_prescriptions_on_customer_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "photo_url"
    t.string   "url"
    t.integer  "price_cents", default: 0, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "admin"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "country_code"
    t.string   "authy_id"
    t.boolean  "verified"
    t.string   "user_code"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "verification_codes", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "user_code"
    t.index ["user_id"], name: "index_verification_codes_on_user_id", using: :btree
  end

  add_foreign_key "customer_addresses", "customers"
  add_foreign_key "customers", "users"
  add_foreign_key "drivers", "users"
  add_foreign_key "order_products", "orders"
  add_foreign_key "order_products", "products"
  add_foreign_key "orders", "customers"
  add_foreign_key "orders", "drivers"
  add_foreign_key "prescriptions", "customers"
  add_foreign_key "verification_codes", "users"
end

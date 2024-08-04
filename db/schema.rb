# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_08_04_152950) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name", limit: 32, null: false
    t.string "full_name", limit: 32, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_products", id: false, force: :cascade do |t|
    t.bigint "category_id", null: false
    t.bigint "product_id", null: false
    t.index ["category_id", "product_id"], name: "index_categories_products_on_category_id_and_product_id"
    t.index ["product_id", "category_id"], name: "index_categories_products_on_product_id_and_category_id"
  end

  create_table "producers", force: :cascade do |t|
    t.string "name", limit: 128, null: false
    t.bigint "ogrn", null: false
    t.bigint "inn", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.check_constraint "length(inn::text) = 12", name: "inn_check"
    t.check_constraint "length(ogrn::text) = 13", name: "ogrn_check"
  end

  create_table "products", force: :cascade do |t|
    t.string "name", limit: 32, null: false
    t.string "full_name", limit: 256, null: false
    t.decimal "price", precision: 8, scale: 2, null: false
    t.text "description"
    t.date "production_date", null: false
    t.integer "guarantee", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "producer_id"
    t.integer "discount"
    t.index ["producer_id"], name: "index_products_on_producer_id"
    t.check_constraint "guarantee = ANY (ARRAY[0, 1])", name: "guarantee_check"
    t.check_constraint "price > 0::numeric", name: "price_check"
  end

  create_table "sellers", force: :cascade do |t|
    t.string "name"
    t.string "contact_info"
    t.string "address"
    t.string "phone_number"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_sellers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "login"
    t.integer "permissions"
    t.string "salt"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "products", "producers"
  add_foreign_key "sellers", "users"
end

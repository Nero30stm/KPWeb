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

ActiveRecord::Schema.define(version: 2018_12_13_211226) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "awards", force: :cascade do |t|
    t.string "name"
    t.string "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dishes", force: :cascade do |t|
    t.string "name", null: false
    t.text "descr", null: false
    t.string "mainPhoto", null: false
    t.float "rate", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "{:foreign_key=>true}_id"
    t.index ["{:foreign_key=>true}_id"], name: "index_dishes_on_{:foreign_key=>true}_id"
  end

  create_table "dishreviews", force: :cascade do |t|
    t.string "name", null: false
    t.text "descr", null: false
    t.integer "rate", null: false
    t.bigint "dish_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dish_id"], name: "index_dishreviews_on_dish_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name", null: false
    t.text "descr", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photoalbums", force: :cascade do |t|
    t.string "photo", null: false
    t.text "descr"
    t.bigint "restaurant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_photoalbums_on_restaurant_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name", null: false
    t.text "descr", null: false
    t.string "mainPhoto", null: false
    t.float "rate", null: false
    t.bigint "restaurant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "price"
    t.index ["restaurant_id"], name: "index_products_on_restaurant_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name", null: false
    t.text "descr", null: false
    t.string "mainPhoto", null: false
    t.string "addr", null: false
    t.float "rate", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "latitude"
    t.decimal "longitude"
  end

  create_table "restbookings", force: :cascade do |t|
    t.bigint "restaurant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_name"
    t.string "email"
    t.string "requested_date"
    t.index ["restaurant_id"], name: "index_restbookings_on_restaurant_id"
  end

  create_table "restreviews", force: :cascade do |t|
    t.string "name", null: false
    t.text "descr", null: false
    t.integer "rate", null: false
    t.bigint "restaurant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_restreviews_on_restaurant_id"
  end

  create_table "workers", force: :cascade do |t|
    t.string "name", null: false
    t.text "descr"
    t.string "job", null: false
    t.string "photo", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "dishreviews", "dishes"
  add_foreign_key "photoalbums", "restaurants"
  add_foreign_key "products", "restaurants"
  add_foreign_key "restbookings", "restaurants"
  add_foreign_key "restreviews", "restaurants"
end

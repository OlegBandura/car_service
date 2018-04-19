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

ActiveRecord::Schema.define(version: 20180419105629) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: :cascade do |t|
    t.string "brand_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "break_categories", force: :cascade do |t|
    t.bigint "garage_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["garage_id"], name: "index_break_categories_on_garage_id"
  end

  create_table "break_sub_categories", force: :cascade do |t|
    t.bigint "break_category_id"
    t.string "break_sub_category_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "price"
    t.index ["break_category_id"], name: "index_break_sub_categories_on_break_category_id"
  end

  create_table "car_models", force: :cascade do |t|
    t.string "model"
    t.bigint "brand_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_car_models_on_brand_id"
  end

  create_table "garage_comments", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "garage_id"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["garage_id"], name: "index_garage_comments_on_garage_id"
    t.index ["user_id"], name: "index_garage_comments_on_user_id"
  end

  create_table "garages", force: :cascade do |t|
    t.bigint "user_id"
    t.string "garage_name"
    t.text "description"
    t.string "city"
    t.string "address"
    t.string "phone"
    t.boolean "diler"
    t.text "image"
    t.string "garage_rating"
    t.string "garage_types", default: [], array: true
    t.string "work_shedule", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "garage_email"
    t.index ["user_id"], name: "index_garages_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_car_id"
    t.bigint "garage_id"
    t.bigint "break_sub_category_id"
    t.string "description"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "times", default: [], array: true
    t.index ["break_sub_category_id"], name: "index_orders_on_break_sub_category_id"
    t.index ["garage_id"], name: "index_orders_on_garage_id"
    t.index ["user_car_id"], name: "index_orders_on_user_car_id"
  end

  create_table "user_cars", force: :cascade do |t|
    t.bigint "brand_id"
    t.bigint "car_model_id"
    t.bigint "user_id"
    t.integer "car_year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_user_cars_on_brand_id"
    t.index ["car_model_id"], name: "index_user_cars_on_car_model_id"
    t.index ["user_id"], name: "index_user_cars_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "roles_mask"
    t.string "roles", default: [], array: true
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end

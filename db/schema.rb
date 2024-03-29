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

ActiveRecord::Schema.define(version: 2022_03_07_134414) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.date "start_booking"
    t.date "end_booking"
    t.bigint "logement_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "voyageur"
    t.integer "t_price"
    t.index ["logement_id"], name: "index_bookings_on_logement_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.bigint "user_id", null: false
    t.bigint "logement_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["logement_id"], name: "index_comments_on_logement_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "logements", force: :cascade do |t|
    t.string "title"
    t.string "adresse"
    t.date "start_date_of_availability"
    t.date "end_date_of_availability"
    t.integer "voyageur"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "city"
    t.float "latitude"
    t.float "longitude"
    t.bigint "user_id"
    t.string "images"
    t.integer "bookings_count", default: 0, null: false
    t.integer "comments_count", default: 0, null: false
    t.integer "price"
    t.string "description"
    t.text "equipments"
    t.index ["user_id"], name: "index_logements_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false
    t.string "name"
    t.string "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "logements"
  add_foreign_key "bookings", "users"
  add_foreign_key "comments", "logements"
  add_foreign_key "comments", "users"
  add_foreign_key "logements", "users"
end

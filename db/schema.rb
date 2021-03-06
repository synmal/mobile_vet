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

ActiveRecord::Schema.define(version: 2019_02_18_035601) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "pet_id"
    t.text "description"
    t.date "appointment_date"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0
    t.time "time"
    t.index ["pet_id"], name: "index_appointments_on_pet_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "diagnoses", force: :cascade do |t|
    t.bigint "appointment_id"
    t.string "comments"
    t.integer "price"
    t.boolean "payment_status", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appointment_id"], name: "index_diagnoses_on_appointment_id"
  end

  create_table "pets", force: :cascade do |t|
    t.string "pet_avatar"
    t.string "name"
    t.integer "age"
    t.string "pet_type"
    t.string "breed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_pets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "avatar"
    t.string "name"
    t.string "address"
    t.integer "roles", default: 1
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_phone"
    t.string "encrypted_phone_iv"
    t.string "email"
  end

  add_foreign_key "appointments", "pets"
  add_foreign_key "appointments", "users"
  add_foreign_key "diagnoses", "appointments"
  add_foreign_key "pets", "users"
end

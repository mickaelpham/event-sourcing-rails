# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_03_222354) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_events", force: :cascade do |t|
    t.integer "model_id", null: false
    t.string "name", null: false
    t.json "data", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }
    t.index ["model_id"], name: "index_account_events_on_model_id"
  end

  create_table "counter_events", force: :cascade do |t|
    t.integer "model_id", null: false
    t.string "name", null: false
    t.json "data", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }
    t.index ["model_id"], name: "index_counter_events_on_model_id"
  end

  create_table "subscription_events", force: :cascade do |t|
    t.integer "model_id", null: false
    t.string "name", null: false
    t.json "data", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }
    t.index ["model_id"], name: "index_subscription_events_on_model_id"
  end

end

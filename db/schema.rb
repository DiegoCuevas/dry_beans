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

ActiveRecord::Schema[7.1].define(version: 2024_04_07_053958) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "deliveries", force: :cascade do |t|
    t.bigint "path_id", null: false
    t.string "description"
    t.integer "status", default: 1
    t.date "delivery_date"
    t.time "delivery_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "signature"
    t.string "observations"
    t.string "delivery_photo"
    t.index ["path_id"], name: "index_deliveries_on_path_id"
  end

  create_table "journeys", force: :cascade do |t|
    t.bigint "origin_id", null: false
    t.bigint "destination_id", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["destination_id"], name: "index_journeys_on_destination_id"
    t.index ["origin_id"], name: "index_journeys_on_origin_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "longitude"
    t.string "latitude"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "paths", force: :cascade do |t|
    t.bigint "journey_id", null: false
    t.date "delivery_date"
    t.time "start_time"
    t.time "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["journey_id"], name: "index_paths_on_journey_id"
  end

  add_foreign_key "deliveries", "paths"
  add_foreign_key "journeys", "locations", column: "destination_id"
  add_foreign_key "journeys", "locations", column: "origin_id"
  add_foreign_key "paths", "journeys"
end

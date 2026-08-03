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

ActiveRecord::Schema[8.1].define(version: 2026_08_03_104558) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "agencies", force: :cascade do |t|
    t.string "agency_id"
    t.string "agency_lang"
    t.string "agency_name"
    t.string "agency_phone"
    t.string "agency_timezone"
    t.string "agency_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agency_id"], name: "index_agencies_on_agency_id", unique: true
  end

  create_table "calendars", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "end_date"
    t.boolean "friday"
    t.boolean "monday"
    t.boolean "saturday"
    t.string "service_id"
    t.string "start_date"
    t.boolean "sunday"
    t.boolean "thursday"
    t.boolean "tuesday"
    t.datetime "updated_at", null: false
    t.boolean "wednesday"
    t.index ["service_id"], name: "index_calendars_on_service_id", unique: true
  end

  create_table "routes", force: :cascade do |t|
    t.bigint "agency_id", null: false
    t.datetime "created_at", null: false
    t.string "route_color"
    t.string "route_id"
    t.string "route_long_name"
    t.string "route_short_name"
    t.string "route_text_color"
    t.integer "route_type"
    t.datetime "updated_at", null: false
    t.index ["agency_id"], name: "index_routes_on_agency_id"
    t.index ["route_id"], name: "index_routes_on_route_id", unique: true
  end

  create_table "stop_times", force: :cascade do |t|
    t.string "arrival_time"
    t.datetime "created_at", null: false
    t.string "departure_time"
    t.integer "drop_off_type"
    t.integer "pickup_type"
    t.bigint "stop_id", null: false
    t.integer "stop_sequence"
    t.bigint "trip_id", null: false
    t.datetime "updated_at", null: false
    t.index ["stop_id"], name: "index_stop_times_on_stop_id"
    t.index ["trip_id"], name: "index_stop_times_on_trip_id"
  end

  create_table "stops", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "location_type"
    t.string "stop_code"
    t.string "stop_desc"
    t.string "stop_id"
    t.decimal "stop_lat"
    t.decimal "stop_lon"
    t.string "stop_name"
    t.datetime "updated_at", null: false
    t.integer "wheelchair_boarding"
    t.string "zone_id"
    t.index ["stop_id"], name: "index_stops_on_stop_id", unique: true
  end

  create_table "trips", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "direction_id"
    t.bigint "route_id", null: false
    t.string "service_id", null: false
    t.string "trip_headsign"
    t.string "trip_id"
    t.datetime "updated_at", null: false
    t.integer "wheelchair_accessible"
    t.index ["route_id"], name: "index_trips_on_route_id"
    t.index ["trip_id"], name: "index_trips_on_trip_id", unique: true
  end

  add_foreign_key "routes", "agencies"
  add_foreign_key "stop_times", "stops"
  add_foreign_key "stop_times", "trips"
  add_foreign_key "trips", "routes"
end

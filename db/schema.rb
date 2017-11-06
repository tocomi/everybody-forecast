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

ActiveRecord::Schema.define(version: 20171029103944) do

  create_table "forecasts", primary_key: ["race_id", "user_id"], force: :cascade do |t|
    t.string   "race_id",                null: false
    t.string   "user_id",                null: false
    t.integer  "horse_01",   default: 0
    t.integer  "horse_02",   default: 0
    t.integer  "horse_03",   default: 0
    t.integer  "horse_04",   default: 0
    t.integer  "horse_05",   default: 0
    t.integer  "horse_06",   default: 0
    t.integer  "horse_07",   default: 0
    t.integer  "horse_08",   default: 0
    t.integer  "horse_09",   default: 0
    t.integer  "horse_10",   default: 0
    t.integer  "horse_11",   default: 0
    t.integer  "horse_12",   default: 0
    t.integer  "horse_13",   default: 0
    t.integer  "horse_14",   default: 0
    t.integer  "horse_15",   default: 0
    t.integer  "horse_16",   default: 0
    t.integer  "horse_17",   default: 0
    t.integer  "horse_18",   default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["race_id", "user_id"], name: "sqlite_autoindex_forecasts_1", unique: true
  end

end
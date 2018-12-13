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

ActiveRecord::Schema.define(version: 2018_12_13_153826) do

  create_table "fixtures", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "home_team"
    t.integer "away_team"
    t.integer "gameweek"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "oppositions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "fixture_id"
    t.integer "team_id"
    t.integer "gameweek"
    t.string "opp_name"
    t.string "opp_short_name_string"
    t.integer "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_oppositions_on_player_id"
  end

  create_table "players", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.integer "team_id"
    t.float "cost"
    t.float "selected_by"
    t.integer "transfers_out_this_gw"
    t.integer "transfers_in_this_gw"
    t.integer "points"
    t.float "ppg"
    t.integer "goals"
    t.integer "assists"
    t.integer "clean_sheets"
    t.float "xg"
    t.float "xa"
    t.integer "bps"
    t.string "fixture_list"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "web_name"
  end

  create_table "teams", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "short_name"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "oppositions", "players"
end

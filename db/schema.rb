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

ActiveRecord::Schema.define(version: 2018_12_11_164049) do

  create_table "fixtures", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "gameweek"
    t.string "opp_name"
    t.string "opp_short_name"
    t.boolean "is_home"
    t.string "difficulty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fixtures_players", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "fixture_id", null: false
    t.bigint "player_id", null: false
    t.index ["fixture_id"], name: "index_fixtures_players_on_fixture_id"
    t.index ["player_id"], name: "index_fixtures_players_on_player_id"
  end

  create_table "players", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "cost"
    t.string "selected_by"
    t.string "transfers_out_this_gw"
    t.string "transfers_in_this_gw"
    t.string "total_points"
    t.string "ppg"
    t.string "goals"
    t.string "assists"
    t.string "clean_sheets"
    t.string "xg"
    t.string "xa"
    t.string "bps"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

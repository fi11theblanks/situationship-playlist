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

ActiveRecord::Schema[8.1].define(version: 2026_06_17_074957) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "playlist_results", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "input_hash"
    t.bigint "situationship_id", null: false
    t.text "tracks"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["situationship_id"], name: "index_playlist_results_on_situationship_id"
    t.index ["user_id"], name: "index_playlist_results_on_user_id"
  end

  create_table "situationships", force: :cascade do |t|
    t.integer "ambiguity_level"
    t.integer "attachment_clash"
    t.datetime "created_at", null: false
    t.integer "emotional_intensity"
    t.integer "hope_level"
    t.integer "jealousy_factor"
    t.integer "last_seen_days_ago"
    t.boolean "others_involved"
    t.integer "phase"
    t.integer "physicality"
    t.integer "power_dynamic"
    t.text "specific_detail"
    t.boolean "talk_happened"
    t.integer "time_of_day"
    t.integer "unnamed_feeling"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_situationships_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "display_name"
    t.string "email"
    t.text "spotify_access_token"
    t.string "spotify_id"
    t.text "spotify_refresh_token"
    t.datetime "token_expires_at"
    t.datetime "updated_at", null: false
  end

  add_foreign_key "playlist_results", "situationships"
  add_foreign_key "playlist_results", "users"
  add_foreign_key "situationships", "users"
end

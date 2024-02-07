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

ActiveRecord::Schema[7.0].define(version: 2024_02_06_234206) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "lobbyists", id: false, force: :cascade do |t|
    t.bigint "primary_lobbyist_id"
    t.string "lobbyist_name"
    t.string "lobbyist_last_name"
    t.string "lobbyist_first_name"
    t.string "lobbyist_middle_name"
    t.string "lobbyist_suffix"
    t.string "lobbyist_firm_name"
    t.string "lobbyist_address"
    t.string "lobbyist_city"
    t.string "lobbyist_state"
    t.string "lobbyist_zip"
    t.string "lobbyist_phone"
    t.string "fiscal_years_registered"
    t.string "lobbyist_type"
    t.string "lobbyist_designation"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["primary_lobbyist_id"], name: "index_lobbyists_on_primary_lobbyist_id", unique: true
  end

end
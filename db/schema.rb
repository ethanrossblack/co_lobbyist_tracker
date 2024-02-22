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

ActiveRecord::Schema[7.0].define(version: 2024_02_11_215305) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bills", force: :cascade do |t|
    t.string "bill_num"
    t.string "title"
    t.string "fiscal_year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "phone"
    t.string "industry_trade_type"
    t.string "business_type"
    t.date "begin_date"
    t.date "end_date"
    t.string "status"
    t.string "ceo_names"
    t.string "fiscal_year"
    t.bigint "annual_lobbyist_registration_id"
    t.bigint "lobbyist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lobbyist_id"], name: "index_clients_on_lobbyist_id"
  end

  create_table "incomes", force: :cascade do |t|
    t.bigint "annual_lobbyist_registration_id"
    t.string "client_name"
    t.string "client_zip"
    t.string "business_type"
    t.string "industry_trade_type"
    t.integer "amount"
    t.date "date_received"
    t.string "report_month"
    t.date "report_due_date"
    t.string "fiscal_year"
    t.bigint "lobbyist_id", null: false
    t.bigint "client_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_incomes_on_client_id"
    t.index ["lobbyist_id"], name: "index_incomes_on_lobbyist_id"
  end

  create_table "lobbyists", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.string "first_name"
    t.string "middle_name"
    t.string "suffix"
    t.string "firm_name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "phone"
    t.string "fiscal_years_registered"
    t.string "lobbyist_type"
    t.string "designation"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "positions", force: :cascade do |t|
    t.string "report_month"
    t.string "fiscal_year"
    t.string "position"
    t.bigint "bill_id", null: false
    t.bigint "lobbyist_id", null: false
    t.bigint "client_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bill_id"], name: "index_positions_on_bill_id"
    t.index ["client_id"], name: "index_positions_on_client_id"
    t.index ["lobbyist_id"], name: "index_positions_on_lobbyist_id"
  end

  add_foreign_key "clients", "lobbyists"
  add_foreign_key "incomes", "clients"
  add_foreign_key "incomes", "lobbyists"
  add_foreign_key "positions", "bills"
  add_foreign_key "positions", "clients"
  add_foreign_key "positions", "lobbyists"
end

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

ActiveRecord::Schema[8.0].define(version: 2025_05_23_055433) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "lands", force: :cascade do |t|
    t.string "location"
    t.decimal "size_value"
    t.string "size_unit"
    t.decimal "size_in_biswas"
    t.bigint "landowner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lease_snapshots", force: :cascade do |t|
    t.bigint "land_id", null: false
    t.bigint "farmer_id"
    t.string "financial_year"
    t.decimal "investment_amount"
    t.decimal "expected_return"
    t.date "start_date"
    t.date "end_date"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["land_id"], name: "index_lease_snapshots_on_land_id"
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "lease_snapshot_id", null: false
    t.decimal "amount"
    t.date "payment_date"
    t.string "mode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lease_snapshot_id"], name: "index_payments_on_lease_snapshot_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "village"
    t.string "district"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "lands", "people", column: "landowner_id"
  add_foreign_key "lease_snapshots", "lands"
  add_foreign_key "lease_snapshots", "people", column: "farmer_id"
  add_foreign_key "payments", "lease_snapshots"
end

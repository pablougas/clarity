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

ActiveRecord::Schema.define(version: 20180116150739) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "street"
    t.string   "street_2"
    t.string   "suite"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "primary"
    t.integer  "client_file_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["client_file_id"], name: "index_addresses_on_client_file_id", using: :btree
  end

  create_table "adjusters", force: :cascade do |t|
    t.string   "company"
    t.string   "first"
    t.string   "middle"
    t.string   "last"
    t.string   "street_one"
    t.string   "street_two"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.date     "asigned_date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "claim_id"
    t.index ["claim_id"], name: "index_adjusters_on_claim_id", using: :btree
  end

  create_table "agents", force: :cascade do |t|
    t.string   "agent_id"
    t.string   "name"
    t.string   "street_one"
    t.string   "street_two"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "claim_id"
    t.index ["claim_id"], name: "index_agents_on_claim_id", using: :btree
  end

  create_table "claims", force: :cascade do |t|
    t.string   "number"
    t.date     "period_begin"
    t.date     "period_end"
    t.date     "loss_date"
    t.string   "company_number"
    t.string   "rating_method"
    t.decimal  "bldg_limit",        precision: 14, scale: 2
    t.decimal  "bldg_ded",          precision: 14, scale: 2
    t.decimal  "bldg_res",          precision: 14, scale: 2
    t.decimal  "con_limit",         precision: 14, scale: 2
    t.decimal  "con_ded",           precision: 14, scale: 2
    t.decimal  "con_res",           precision: 14, scale: 2
    t.string   "floors"
    t.string   "enclosure_type"
    t.string   "con_location"
    t.string   "flood_program"
    t.string   "flood_risk_zone"
    t.string   "flood_comm_number"
    t.string   "elevated_ind"
    t.decimal  "low_floor_elev",    precision: 12, scale: 3
    t.decimal  "flood_elev",        precision: 12, scale: 3
    t.date     "construction_date"
    t.string   "post_firm_ind"
    t.string   "obstruction_code"
    t.integer  "num_units"
    t.boolean  "primary_res"
    t.string   "condo_code"
    t.decimal  "rep_val",           precision: 14, scale: 2
    t.string   "contact_first"
    t.string   "contact_middle"
    t.string   "contact_last"
    t.string   "contact_home"
    t.string   "contact_work"
    t.string   "contact_cell"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.integer  "policy_id"
    t.decimal  "icc_limit",         precision: 14, scale: 2
    t.decimal  "icc_ded",           precision: 14, scale: 2
    t.decimal  "icc_res",           precision: 14, scale: 2
    t.index ["policy_id"], name: "index_claims_on_policy_id", using: :btree
  end

  create_table "client_files", force: :cascade do |t|
    t.string   "client_number"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.string   "primary"
    t.integer  "client_file_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["client_file_id"], name: "index_contacts_on_client_file_id", using: :btree
  end

  create_table "examiners", force: :cascade do |t|
    t.string   "first"
    t.string   "middle"
    t.string   "last"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "claim_id"
    t.index ["claim_id"], name: "index_examiners_on_claim_id", using: :btree
  end

  create_table "insureds", force: :cascade do |t|
    t.string   "insured_type"
    t.string   "full_name"
    t.string   "first"
    t.string   "middle"
    t.string   "last"
    t.string   "street_one"
    t.string   "street_two"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "home"
    t.string   "work"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "policy_id"
    t.index ["policy_id"], name: "index_insureds_on_policy_id", using: :btree
  end

  create_table "insurers", force: :cascade do |t|
    t.string   "name"
    t.string   "street_one"
    t.string   "street_two"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.integer  "policy_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["policy_id"], name: "index_insurers_on_policy_id", using: :btree
  end

  create_table "mortgagees", force: :cascade do |t|
    t.string   "mortgagee_type"
    t.string   "first"
    t.string   "name"
    t.string   "middle"
    t.string   "last"
    t.string   "street_one"
    t.string   "street_two"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "claim_id"
    t.index ["claim_id"], name: "index_mortgagees_on_claim_id", using: :btree
  end

  create_table "policies", force: :cascade do |t|
    t.string   "number"
    t.date     "effective_date"
    t.string   "policy_type"
    t.string   "agency"
    t.string   "street_one"
    t.string   "street_two"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "occupancy_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "remarks", force: :cascade do |t|
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "claim_id"
    t.index ["claim_id"], name: "index_remarks_on_claim_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first"
    t.string   "last"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "addresses", "client_files"
  add_foreign_key "adjusters", "claims"
  add_foreign_key "agents", "claims"
  add_foreign_key "claims", "policies"
  add_foreign_key "contacts", "client_files"
  add_foreign_key "examiners", "claims"
  add_foreign_key "insureds", "policies"
  add_foreign_key "insurers", "policies"
  add_foreign_key "mortgagees", "claims"
  add_foreign_key "remarks", "claims"
end

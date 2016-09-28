# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160420212735) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string   "business_name",  null: false
    t.string   "contact_email",  null: false
    t.string   "contact_phone"
    t.string   "street_address", null: false
    t.string   "neighborhood",   null: false
    t.string   "zip_code",       null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "employee_work_orders", force: :cascade do |t|
    t.integer  "user_id",       null: false
    t.integer  "work_order_id", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string   "name",                            null: false
    t.string   "description",                     null: false
    t.integer  "frequency"
    t.float    "estimated_price",                 null: false
    t.boolean  "rainy_day",       default: false
    t.integer  "client_id",                       null: false
    t.integer  "route_id"
    t.integer  "employee_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "routes", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "day"
    t.integer  "employee_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "name",                   default: "", null: false
    t.string   "phone",                  default: "", null: false
    t.boolean  "admin"
    t.date     "hire_date"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "work_orders", force: :cascade do |t|
    t.integer  "route_id"
    t.integer  "job_id",                             null: false
    t.float    "final_price"
    t.text     "notes"
    t.integer  "week"
    t.string   "complete",    default: "incomplete"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

end

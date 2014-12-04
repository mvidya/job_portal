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

ActiveRecord::Schema.define(version: 20141204113142) do

  create_table "applied_jobs", force: true do |t|
    t.integer  "employee_id"
    t.integer  "job_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employees", force: true do |t|
    t.integer  "user_id"
    t.string   "Fname"
    t.string   "Lname"
    t.date     "dob"
    t.string   "gender"
    t.string   "email"
    t.integer  "ph_number"
    t.string   "state"
    t.string   "city"
    t.text     "address"
    t.integer  "pin_code"
    t.string   "qualification"
    t.string   "univercity"
    t.integer  "percentage"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employers", force: true do |t|
    t.integer  "user_id"
    t.string   "company_name"
    t.string   "website_url"
    t.string   "country"
    t.string   "state"
    t.string   "city"
    t.string   "contact_person"
    t.string   "contact_number"
    t.string   "contact_email"
    t.text     "full_address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "job_types", force: true do |t|
    t.string   "type_name"
    t.text     "type_description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", force: true do |t|
    t.integer  "employer_id"
    t.integer  "job_type_id"
    t.date     "job_posted_on"
    t.date     "job_expires_on"
    t.integer  "salary"
    t.string   "functional_area"
    t.integer  "experience"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end

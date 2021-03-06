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

ActiveRecord::Schema.define(version: 20170603041001) do

  create_table "employees", force: :cascade do |t|
    t.string   "name"
    t.date     "start_date"
    t.string   "phone"
    t.string   "email"
    t.string   "role"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "members", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.string   "gender"
    t.date     "join_date"
    t.integer  "employee_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "school"
    t.text     "comment"
    t.date     "birthdate"
  end

  create_table "posts", force: :cascade do |t|
    t.text     "content"
    t.integer  "employee_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "registrations", force: :cascade do |t|
    t.integer  "member_id"
    t.string   "seat_number"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "employee_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "wait_statuses", force: :cascade do |t|
    t.string   "table_type"
    t.date     "start_date"
    t.integer  "member_id"
    t.integer  "employee_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.date     "end_date"
  end

end

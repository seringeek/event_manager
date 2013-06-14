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

ActiveRecord::Schema.define(version: 20130610045032) do

  create_table "events", force: true do |t|
    t.string   "name"
    t.date     "event_date"
    t.string   "short_desc"
    t.text     "about"
    t.string   "photo"
    t.decimal  "ticket_fee",   precision: 16, scale: 2
    t.string   "created_from"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events_users", force: true do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.string   "attend_flg",   limit: 1
    t.string   "created_from"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "gender",       limit: 1
    t.string   "email"
    t.string   "password"
    t.string   "created_from"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

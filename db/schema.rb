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

ActiveRecord::Schema.define(version: 20141013115355) do

  create_table "areas", force: true do |t|
    t.integer  "prefecture_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "osmotics", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prefectures", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spring_infos", force: true do |t|
    t.integer  "area_id"
    t.string   "name"
    t.integer  "category_id"
    t.string   "quality_name"
    t.string   "old_quality_name"
    t.float    "temperature"
    t.float    "pH"
    t.integer  "osmotic_id"
    t.float    "discharge"
    t.string   "place"
    t.string   "transportation"
    t.float    "metasilicic_acid"
    t.string   "remarks"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

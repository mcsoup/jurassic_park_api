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

ActiveRecord::Schema.define(version: 20150901162523) do

  create_table "cages", force: true do |t|
    t.integer  "max_capacity"
    t.boolean  "power"
    t.integer  "contained"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dinosaurs", force: true do |t|
    t.string   "name"
    t.string   "species"
    t.string   "diet"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cage_id"
  end

  add_index "dinosaurs", ["cage_id"], name: "index_dinosaurs_on_cage_id"
  add_index "dinosaurs", ["diet"], name: "index_dinosaurs_on_diet"
  add_index "dinosaurs", ["species"], name: "index_dinosaurs_on_species"

end
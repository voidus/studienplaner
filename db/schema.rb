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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 4) do

  create_table "moduls", :force => true do |t|
    t.string  "name"
    t.text    "source_tex"
    t.integer "credits"
    t.boolean "stammmodul", :default => false
  end

  create_table "moduls_studienplans", :id => false, :force => true do |t|
    t.integer "modul_id"
    t.integer "studienplan_id"
  end

  add_index "moduls_studienplans", ["modul_id"], :name => "index_moduls_studienplans_on_modul_id"
  add_index "moduls_studienplans", ["studienplan_id"], :name => "index_moduls_studienplans_on_studienplan_id"

  create_table "studiengangs", :force => true do |t|
    t.string "name"
    t.text   "constraints"
  end

  create_table "studienplans", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "studiengang_id"
  end

end

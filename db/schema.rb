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

ActiveRecord::Schema.define(version: 2020_09_10_124217) do

  create_table "drinks", force: :cascade do |t|
    t.string "name"
    t.integer "liquor_id"
    t.integer "liquor_id2"
    t.integer "mixer_id"
    t.integer "mixer_id2"
  end

  create_table "fav_lists", force: :cascade do |t|
    t.string "name"
    t.integer "drink_id1"
    t.integer "drink_id2"
    t.integer "drink_id3"
    t.integer "drink_id4"
    t.integer "drink_id5"
  end

  create_table "liquors", force: :cascade do |t|
    t.string "name"
  end

  create_table "mixers", force: :cascade do |t|
    t.string "name"
  end

  create_table "secondary_liquors", force: :cascade do |t|
    t.string "name"
  end

  create_table "secondary_mixers", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password"
    t.string "status"
  end

end

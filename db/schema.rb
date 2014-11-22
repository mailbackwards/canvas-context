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

ActiveRecord::Schema.define(version: 20141122191618) do

  create_table "galleries", force: true do |t|
    t.string   "guid"
    t.string   "parent_guid"
    t.string   "link"
    t.string   "title"
    t.string   "state"
    t.string   "captions"
    t.string   "images"
    t.datetime "pub_date"
    t.datetime "creation_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stories", force: true do |t|
    t.string   "guid"
    t.string   "link"
    t.string   "title"
    t.string   "description"
    t.text     "body"
    t.string   "largeimage"
    t.string   "smallimage"
    t.string   "video"
    t.string   "source"
    t.datetime "pubdate"
    t.string   "author"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "videos", force: true do |t|
    t.string   "aj_id"
    t.string   "name"
    t.string   "ad_keys"
    t.string   "short_description"
    t.string   "long_description"
    t.datetime "creation_date"
    t.datetime "published_date"
    t.datetime "last_modified_date"
    t.string   "link_url"
    t.text     "link_text"
    t.string   "tags"
    t.string   "video_still_url"
    t.string   "thumbnail_url"
    t.string   "reference_id"
    t.integer  "length"
    t.string   "economics"
    t.integer  "plays_total"
    t.integer  "plays_trailing_week"
    t.string   "flvurl"
    t.string   "renditions"
    t.string   "flv_full_length"
    t.string   "video_full_length"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

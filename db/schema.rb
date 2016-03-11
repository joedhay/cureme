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

ActiveRecord::Schema.define(version: 20160311074504) do

  create_table "categories", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.integer  "user_id",     limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: :cascade do |t|
    t.string   "description",  limit: 255
    t.integer  "product_id",   limit: 4
    t.integer  "user_id",      limit: 4
    t.integer  "comment_to",   limit: 4
    t.integer  "comment_from", limit: 4
    t.integer  "parent_id",    limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "follow_users", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.integer  "followed_by", limit: 4
    t.integer  "total",       limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "like_comments", force: :cascade do |t|
    t.integer  "comment_id", limit: 4
    t.integer  "likes",      limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string   "message",    limit: 255
    t.integer  "from_id",    limit: 4
    t.integer  "to_id",      limit: 4
    t.integer  "product_id", limit: 4
    t.integer  "group_id",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: :cascade do |t|
    t.integer  "category_id",        limit: 4
    t.string   "item_name",          limit: 255
    t.decimal  "price",                          precision: 10
    t.string   "description",        limit: 255
    t.string   "groups",             limit: 255
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.string   "item1_file_name",    limit: 255
    t.string   "item1_content_type", limit: 255
    t.integer  "item1_file_size",    limit: 4
    t.datetime "item1_updated_at"
    t.string   "item2_file_name",    limit: 255
    t.string   "item2_content_type", limit: 255
    t.integer  "item2_file_size",    limit: 4
    t.datetime "item2_updated_at"
    t.string   "item3_file_name",    limit: 255
    t.string   "item3_content_type", limit: 255
    t.integer  "item3_file_size",    limit: 4
    t.datetime "item3_updated_at"
    t.string   "item4_file_name",    limit: 255
    t.string   "item4_content_type", limit: 255
    t.integer  "item4_file_size",    limit: 4
    t.datetime "item4_updated_at"
    t.integer  "user_id",            limit: 4
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.string   "session_id", limit: 255,   null: false
    t.text     "data",       limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name",          limit: 255
    t.string   "last_name",           limit: 255
    t.string   "address",             limit: 255
    t.string   "phone_number",        limit: 255
    t.string   "email",               limit: 255
    t.string   "gender",              limit: 255
    t.string   "password",            limit: 255
    t.string   "confirmed_password",  limit: 255
    t.string   "date_of_birth",       limit: 255
    t.string   "status",              limit: 255
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "username",            limit: 255
    t.string   "alias",               limit: 255
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
    t.integer  "logged_count",        limit: 4
  end

end

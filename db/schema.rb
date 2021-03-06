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

ActiveRecord::Schema.define(version: 20150308104129) do

  create_table "access_tokens", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "token",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "access_tokens", ["user_id"], name: "index_access_tokens_on_user_id", using: :btree

  create_table "repositories", force: :cascade do |t|
    t.string   "name",             limit: 255
    t.string   "full_name",        limit: 255
    t.integer  "owner_id",         limit: 4
    t.text     "description",      limit: 65535
    t.boolean  "fork",             limit: 1
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "homepage",         limit: 255
    t.integer  "stargazers_count", limit: 4,     default: 0, null: false
    t.string   "language",         limit: 255
    t.datetime "fetched_at"
    t.integer  "rank",             limit: 4
  end

  add_index "repositories", ["full_name"], name: "index_repositories_on_full_name", using: :btree
  add_index "repositories", ["owner_id"], name: "index_repositories_on_owner_id", using: :btree
  add_index "repositories", ["rank"], name: "index_repositories_on_rank", using: :btree
  add_index "repositories", ["stargazers_count"], name: "index_repositories_on_stargazers_count", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "login",            limit: 255
    t.string   "avatar_url",       limit: 255
    t.string   "type",             limit: 255
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.datetime "queued_at"
    t.integer  "stargazers_count", limit: 4,   default: 0, null: false
    t.integer  "rank",             limit: 4
    t.string   "location",         limit: 255
  end

  add_index "users", ["login"], name: "index_users_on_login", using: :btree
  add_index "users", ["queued_at"], name: "index_users_on_queued_at", using: :btree
  add_index "users", ["rank"], name: "index_users_on_rank", using: :btree
  add_index "users", ["stargazers_count"], name: "index_users_on_stargazers_count", using: :btree

end

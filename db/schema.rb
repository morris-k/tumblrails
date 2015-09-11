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

ActiveRecord::Schema.define(version: 20150910225408) do

  create_table "blog_follows", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "blog_follows", ["followed_id"], name: "index_blog_follows_on_followed_id"
  add_index "blog_follows", ["follower_id", "followed_id"], name: "index_blog_follows_on_follower_id_and_followed_id", unique: true
  add_index "blog_follows", ["follower_id"], name: "index_blog_follows_on_follower_id"

  create_table "blogs", force: :cascade do |t|
    t.string   "name"
    t.string   "title",      default: "My Blog"
    t.boolean  "primary"
    t.boolean  "admin"
    t.integer  "user_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "blogs", ["name"], name: "index_blogs_on_name", unique: true
  add_index "blogs", ["user_id"], name: "index_blogs_on_user_id"

  create_table "user_blog_relations", force: :cascade do |t|
    t.boolean  "primary"
    t.integer  "user_id"
    t.integer  "blog_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_blog_relations", ["blog_id"], name: "index_user_blog_relations_on_blog_id"
  add_index "user_blog_relations", ["user_id", "blog_id"], name: "index_user_blog_relations_on_user_id_and_blog_id"
  add_index "user_blog_relations", ["user_id"], name: "index_user_blog_relations_on_user_id"

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name",                                null: false
    t.integer  "following"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end

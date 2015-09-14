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

ActiveRecord::Schema.define(version: 20150914010853) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blog_follows", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "blog_follows", ["followed_id"], name: "index_blog_follows_on_followed_id", using: :btree
  add_index "blog_follows", ["follower_id", "followed_id"], name: "index_blog_follows_on_follower_id_and_followed_id", unique: true, using: :btree
  add_index "blog_follows", ["follower_id"], name: "index_blog_follows_on_follower_id", using: :btree

  create_table "blogs", force: :cascade do |t|
    t.string   "name"
    t.string   "title",      default: "My Blog"
    t.boolean  "primary"
    t.boolean  "admin"
    t.integer  "user_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "avatar"
  end

  add_index "blogs", ["avatar"], name: "index_blogs_on_avatar", using: :btree
  add_index "blogs", ["name"], name: "index_blogs_on_name", unique: true, using: :btree
  add_index "blogs", ["user_id"], name: "index_blogs_on_user_id", using: :btree

  create_table "likes", force: :cascade do |t|
    t.string   "reblog_key"
    t.integer  "post_id"
    t.integer  "liker_id"
    t.integer  "liked_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "likes", ["reblog_key"], name: "index_likes_on_reblog_key", using: :btree

  create_table "post_attachments", force: :cascade do |t|
    t.integer  "post_id"
    t.string   "attachment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "post_attachments", ["post_id", "attachment"], name: "index_post_attachments_on_post_id_and_attachment", using: :btree
  add_index "post_attachments", ["post_id"], name: "index_post_attachments_on_post_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.integer  "blog_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "post_type"
    t.string   "title"
    t.text     "body"
    t.text     "caption"
    t.string   "reblog_key"
  end

  add_index "posts", ["blog_id"], name: "index_posts_on_blog_id", using: :btree
  add_index "posts", ["post_type", "caption"], name: "index_posts_on_post_type_and_caption", using: :btree
  add_index "posts", ["post_type", "title", "body"], name: "index_posts_on_post_type_and_title_and_body", using: :btree

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

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

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end

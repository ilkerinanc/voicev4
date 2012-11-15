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

ActiveRecord::Schema.define(:version => 20121118154712) do

  create_table "friendships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "approved"
  end

  create_table "interest_posts", :force => true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "interest_id"
    t.boolean  "in_trash"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "interests", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "in_trash"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "creator_id"
  end

  create_table "occasions", :force => true do |t|
    t.string   "name"
    t.integer  "creator_id"
    t.boolean  "in_trash"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.date     "time"
  end

  create_table "subscriptions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "interest_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "taggings", :force => true do |t|
    t.integer  "interest_id"
    t.integer  "tag_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.boolean  "in_trash"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "name"
    t.string   "surname"
    t.text     "description"
    t.boolean  "in_trash"
    t.integer  "privilege"
    t.text     "current_work"
    t.string   "provider"
    t.string   "uid"
    t.datetime "oauth_expires_at"
    t.string   "oauth_token"
  end

end

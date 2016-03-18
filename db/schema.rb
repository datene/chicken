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

ActiveRecord::Schema.define(version: 20160318105828) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "challenges", force: :cascade do |t|
    t.string   "name"
    t.datetime "start_date"
    t.datetime "deadline"
    t.integer  "allotment"
    t.string   "status"
    t.string   "activity"
    t.integer  "creator_id"
    t.integer  "challenger_id"
    t.integer  "wager_amount"
    t.text     "wager_description"
    t.string   "wager_name"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "challenges", ["challenger_id"], name: "index_challenges_on_challenger_id", using: :btree
  add_index "challenges", ["creator_id"], name: "index_challenges_on_creator_id", using: :btree

  create_table "checkpoints", force: :cascade do |t|
    t.integer  "challenger_score"
    t.integer  "challenge_id"
    t.integer  "creator_score"
    t.integer  "week"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "checkpoints", ["challenge_id"], name: "index_checkpoints_on_challenge_id", using: :btree

  create_table "logged_times", force: :cascade do |t|
    t.integer  "challenge_id"
    t.integer  "user_id"
    t.integer  "amount"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "logged_times", ["challenge_id"], name: "index_logged_times_on_challenge_id", using: :btree
  add_index "logged_times", ["user_id"], name: "index_logged_times_on_user_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.text     "content"
    t.integer  "challenge_id"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "picture"
    t.string   "provider"
    t.string   "uid"
    t.string   "token"
    t.datetime "token_expiry"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "challenges", "users", column: "challenger_id"
  add_foreign_key "challenges", "users", column: "creator_id"
  add_foreign_key "checkpoints", "challenges"
  add_foreign_key "logged_times", "challenges"
  add_foreign_key "logged_times", "users"
end

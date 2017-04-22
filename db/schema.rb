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

ActiveRecord::Schema.define(version: 20170305150501) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", force: :cascade do |t|
    t.string   "username",               limit: 50,                 null: false
    t.string   "name",                   limit: 50,                 null: false
    t.string   "email",                                             null: false
    t.string   "password_digest",                                   null: false
    t.integer  "status_id",              limit: 2
    t.boolean  "admin",                             default: false, null: false
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.integer  "sign_in_count",                     default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["status_id"], name: "index_users_on_status_id", using: :btree
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

end

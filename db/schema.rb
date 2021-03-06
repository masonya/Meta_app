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

ActiveRecord::Schema.define(version: 2019_06_01_120212) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_transfers", force: :cascade do |t|
    t.integer "transmitter_id"
    t.integer "transferable_id"
    t.string "transferable_type"
    t.string "email"
    t.integer "inheritor_id"
    t.string "inheritor_email"
    t.string "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "accepted", default: false
    t.boolean "checked", default: false
  end

  create_table "appoint_responsibles", force: :cascade do |t|
    t.string "email"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "inheritor_email"
    t.integer "inheritor_id"
    t.boolean "accepted", default: false
    t.string "file"
  end

  create_table "death_certificates", force: :cascade do |t|
    t.string "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "documents", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "cover"
    t.string "receiver"
    t.string "image"
    t.string "email"
  end

  create_table "instructions", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "receiver"
    t.string "email"
  end

  create_table "invites", force: :cascade do |t|
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "responsibility_transfers", force: :cascade do |t|
    t.string "inheritor_email"
    t.integer "transmitter_id"
    t.integer "inheritor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "r_transferable_id"
    t.string "r_transferable_type"
    t.string "transmitter_email"
    t.boolean "accepted", default: false
  end

  create_table "social_accounts", force: :cascade do |t|
    t.string "title"
    t.string "name"
    t.text "body"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "login"
    t.string "receiver"
    t.string "password"
    t.string "action"
    t.string "cover"
    t.string "email"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "receiver"
    t.string "login"
    t.string "password"
    t.string "email"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "transmitter"
    t.boolean "inheritor"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wallets", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password"
    t.string "login"
    t.string "receiver"
    t.string "email"
    t.string "action"
  end

end

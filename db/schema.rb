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

ActiveRecord::Schema.define(version: 2018_08_14_185228) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text "desc"
    t.bigint "user_id"
    t.bigint "sol_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sol_id"], name: "index_comments_on_sol_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "logs", force: :cascade do |t|
    t.string "ope"
    t.text "log"
    t.bigint "sol_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sol_id"], name: "index_logs_on_sol_id"
  end

  create_table "sol_tags", force: :cascade do |t|
    t.bigint "sol_id"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sol_id"], name: "index_sol_tags_on_sol_id"
    t.index ["tag_id"], name: "index_sol_tags_on_tag_id"
  end

  create_table "sols", force: :cascade do |t|
    t.text "title"
    t.text "desc"
    t.bigint "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_one_id"
    t.integer "user_two_id"
    t.index ["state_id"], name: "index_sols_on_state_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "code"
    t.text "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "rut"
    t.string "name"
    t.string "photo"
    t.string "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["invitations_count"], name: "index_users_on_invitations_count"
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_users_on_invited_by_type_and_invited_by_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "sols"
  add_foreign_key "comments", "users"
  add_foreign_key "logs", "sols"
  add_foreign_key "sol_tags", "sols"
  add_foreign_key "sol_tags", "tags"
  add_foreign_key "sols", "states"
  add_foreign_key "sols", "users", column: "user_one_id"
  add_foreign_key "sols", "users", column: "user_two_id"
end

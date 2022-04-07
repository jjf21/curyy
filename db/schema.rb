# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_04_07_153616) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cvs", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "theme_id", null: false
    t.string "body_bg"
    t.string "main_color"
    t.string "text_color"
    t.string "font_family"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "header_bg"
    t.string "body_bg_pattern"
    t.string "font_size"
    t.index ["theme_id"], name: "index_cvs_on_theme_id"
    t.index ["user_id"], name: "index_cvs_on_user_id"
  end

  create_table "experiences", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "start_date"
    t.string "end_date"
    t.boolean "current", default: false, null: false
    t.string "title"
    t.text "description"
    t.string "company"
    t.string "location"
    t.integer "item_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position"
    t.index ["user_id"], name: "index_experiences_on_user_id"
  end

  create_table "links", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_links_on_user_id"
  end

  create_table "skills", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.integer "level"
    t.string "certification"
    t.integer "item_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_skills_on_user_id"
  end

  create_table "themes", force: :cascade do |t|
    t.string "name"
    t.string "body_bg"
    t.string "main_color"
    t.string "text_color"
    t.string "font_family"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "header_bg"
    t.string "body_bg_pattern"
    t.string "font_size"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.date "birthdate"
    t.string "phone"
    t.string "address"
    t.string "headline"
    t.string "about"
    t.string "website"
    t.text "interests"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "cv_email"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cvs", "themes"
  add_foreign_key "cvs", "users"
  add_foreign_key "experiences", "users"
  add_foreign_key "links", "users"
  add_foreign_key "skills", "users"
end

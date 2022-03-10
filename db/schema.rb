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

ActiveRecord::Schema[7.0].define(version: 2022_03_09_171645) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "developers", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "developers_languages", force: :cascade do |t|
    t.bigint "developer_id", null: false
    t.bigint "language_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["developer_id"], name: "index_developers_languages_on_developer_id"
    t.index ["language_id"], name: "index_developers_languages_on_language_id"
  end

  create_table "developers_programming_languages", force: :cascade do |t|
    t.bigint "developer_id", null: false
    t.bigint "programming_language_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["developer_id"], name: "index_developers_programming_languages_on_developer_id"
    t.index ["programming_language_id"], name: "pro_lan_id"
  end

  create_table "interviews", force: :cascade do |t|
    t.integer "score"
    t.bigint "developer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["developer_id"], name: "index_interviews_on_developer_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "programming_languages", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "developers_languages", "developers"
  add_foreign_key "developers_languages", "languages"
  add_foreign_key "developers_programming_languages", "developers"
  add_foreign_key "developers_programming_languages", "programming_languages"
  add_foreign_key "interviews", "developers"
end

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

ActiveRecord::Schema.define(version: 2020_01_18_154913) do

  create_table "a_cards", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "q_card_id", null: false
    t.string "theme"
    t.text "description"
    t.string "when_to_use1"
    t.string "when_to_use2"
    t.string "when_to_use3"
    t.string "when_to_use4"
    t.string "when_to_use5"
    t.string "relation1_theme"
    t.text "relation1_description"
    t.string "relation1_when_to_use1"
    t.string "relation1_when_to_use2"
    t.string "relation1_when_to_use3"
    t.string "relation2_theme"
    t.text "relation2_description"
    t.string "relation2_when_to_use1"
    t.string "relation2_when_to_use2"
    t.string "relation2_when_to_use3"
    t.string "relation3_theme"
    t.text "relation3_description"
    t.string "relation3_when_to_use1"
    t.string "relation3_when_to_use2"
    t.string "relation3_when_to_use3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["q_card_id"], name: "index_a_cards_on_q_card_id"
    t.index ["user_id"], name: "index_a_cards_on_user_id"
  end

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "a_card_id", null: false
    t.text "text", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["a_card_id"], name: "index_comments_on_a_card_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "q_cards", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "theme"
    t.text "description"
    t.text "m_description"
    t.integer "language_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_q_cards_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nickname", null: false
    t.text "description"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "mother_language_id", null: false
    t.integer "learning_language_id", null: false
    t.integer "site_language_id", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end

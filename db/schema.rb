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

ActiveRecord::Schema.define(version: 20180212202646) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "circuit_images", force: :cascade do |t|
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.bigint "circuit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["circuit_id"], name: "index_circuit_images_on_circuit_id"
  end

  create_table "circuits", force: :cascade do |t|
    t.string "name"
    t.string "subtitle"
    t.string "header_image_file_name"
    t.string "header_image_content_type"
    t.integer "header_image_file_size"
    t.datetime "header_image_updated_at"
    t.string "content_header_image_file_name"
    t.string "content_header_image_content_type"
    t.integer "content_header_image_file_size"
    t.datetime "content_header_image_updated_at"
    t.string "content_title"
    t.string "content_subtitle"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug", null: false
    t.string "shortcut"
    t.index ["shortcut"], name: "index_circuits_on_shortcut", unique: true
    t.index ["slug"], name: "index_circuits_on_slug", unique: true
  end

  create_table "images", force: :cascade do |t|
    t.string "title"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "instagrams", force: :cascade do |t|
    t.string "user_name"
    t.string "user_username"
    t.string "user_picture_url"
    t.string "image_url"
    t.integer "likes"
    t.integer "comments"
    t.bigint "totem_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "approved", default: false
    t.string "media_id"
    t.string "link"
    t.index ["totem_id"], name: "index_instagrams_on_totem_id"
  end

  create_table "pages", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "slug"
  end

  create_table "polls", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "origin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taggings", id: :serial, force: :cascade do |t|
    t.integer "tag_id"
    t.string "taggable_type"
    t.integer "taggable_id"
    t.string "tagger_type"
    t.integer "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "tips", force: :cascade do |t|
    t.text "content"
    t.integer "rate", default: 0
    t.boolean "approved", default: false
    t.bigint "totem_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["totem_id"], name: "index_tips_on_totem_id"
  end

  create_table "totem_images", force: :cascade do |t|
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.bigint "totem_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["totem_id"], name: "index_totem_images_on_totem_id"
  end

  create_table "totems", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "main_image_file_name"
    t.string "main_image_content_type"
    t.integer "main_image_file_size"
    t.datetime "main_image_updated_at"
    t.string "header_image_file_name"
    t.string "header_image_content_type"
    t.integer "header_image_file_size"
    t.datetime "header_image_updated_at"
    t.string "infographic_file_name"
    t.string "infographic_content_type"
    t.integer "infographic_file_size"
    t.datetime "infographic_updated_at"
    t.text "content"
    t.string "location"
    t.float "latitude"
    t.float "longitude"
    t.integer "position"
    t.bigint "circuit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug", null: false
    t.string "infographic_text"
    t.text "manual_address"
    t.string "shortcut"
    t.string "hashtag"
    t.index ["circuit_id"], name: "index_totems_on_circuit_id"
    t.index ["shortcut"], name: "index_totems_on_shortcut", unique: true
    t.index ["slug"], name: "index_totems_on_slug", unique: true
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "circuit_images", "circuits"
  add_foreign_key "instagrams", "totems"
  add_foreign_key "tips", "totems"
  add_foreign_key "totem_images", "totems"
  add_foreign_key "totems", "circuits"
end

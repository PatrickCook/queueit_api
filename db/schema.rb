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

ActiveRecord::Schema.define(version: 2019_10_04_224909) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "group_queues", force: :cascade do |t|
    t.text "name", null: false
    t.boolean "is_playing", default: false, null: false
    t.bigint "user_id"
    t.integer "cur_members", default: 0
    t.integer "max_members", default: 20
    t.integer "cur_songs", default: 0
    t.integer "max_songs", default: 20
    t.boolean "is_private", default: false, null: false
    t.text "password_hash"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_group_queues_on_user_id"
  end

  create_table "group_queues_users", id: false, force: :cascade do |t|
    t.bigint "group_queue_id", null: false
    t.bigint "user_id", null: false
    t.index ["group_queue_id", "user_id"], name: "index_group_queues_users_on_group_queue_id_and_user_id"
  end

  create_table "songs", force: :cascade do |t|
    t.text "title", null: false
    t.text "artist", null: false
    t.text "album_image_url", null: false
    t.text "preview_uri"
    t.text "spotify_uri", null: false
    t.boolean "is_playing", default: false, null: false
    t.boolean "has_played", default: false, null: false
    t.bigint "group_queue_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_queue_id"], name: "index_songs_on_group_queue_id"
  end

  create_table "users", force: :cascade do |t|
    t.text "username", null: false
    t.text "password_hash", null: false
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.bigint "song_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["song_id"], name: "index_votes_on_song_id"
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

  add_foreign_key "group_queues", "users"
  add_foreign_key "songs", "group_queues"
  add_foreign_key "votes", "songs"
  add_foreign_key "votes", "users"
end

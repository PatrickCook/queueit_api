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

ActiveRecord::Schema.define(version: 2019_10_13_014636) do

  create_table "groups", force: :cascade do |t|
    t.text "name", null: false
    t.boolean "is_playing", default: false, null: false
    t.integer "cur_members", default: 0
    t.integer "max_members", default: 20
    t.integer "cur_songs", default: 0
    t.integer "max_songs", default: 20
    t.boolean "is_private", default: false, null: false
    t.text "password_hash"
    t.integer "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_groups_on_owner_id"
  end

  create_table "groups_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "group_id", null: false
    t.index ["group_id", "user_id"], name: "index_groups_users_on_group_id_and_user_id", unique: true
    t.index ["user_id", "group_id"], name: "index_groups_users_on_user_id_and_group_id", unique: true
  end

  create_table "songs", force: :cascade do |t|
    t.text "title", null: false
    t.text "artist", null: false
    t.text "album_image_url", null: false
    t.text "preview_uri"
    t.text "spotify_uri", null: false
    t.boolean "is_playing", default: false, null: false
    t.boolean "has_played", default: false, null: false
    t.integer "group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_songs_on_group_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "votes", force: :cascade do |t|
    t.integer "song_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["song_id"], name: "index_votes_on_song_id"
    t.index ["user_id", "song_id"], name: "index_votes_on_user_id_and_song_id", unique: true
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

end

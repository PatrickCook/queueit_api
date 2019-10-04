# create_table "songs", force: :cascade do |t|
#   t.text "title", null: false
#   t.text "artist", null: false
#   t.text "album_image_url", null: false
#   t.text "preview_uri"
#   t.text "spotify_uri", null: false
#   t.boolean "is_playing", default: false, null: false
#   t.boolean "has_played", default: false, null: false
#   t.bigint "group_queue_id", null: false
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.index ["group_queue_id"], name: "index_songs_on_group_queue_id"
# end

class Song < ApplicationRecord
  belongs_to :group_queue
end

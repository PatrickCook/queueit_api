# create_table "votes", force: :cascade do |t|
#   t.bigint "song_id", null: false
#   t.bigint "user_id", null: false
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.index ["song_id"], name: "index_votes_on_song_id"
#   t.index ["user_id"], name: "index_votes_on_user_id"
# end

class Vote < ApplicationRecord
  belongs_to :song
  belongs_to :user

end

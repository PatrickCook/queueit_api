# == Schema Information
#
# Table name: votes
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  song_id    :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_votes_on_song_id              (song_id)
#  index_votes_on_user_id              (user_id)
#  index_votes_on_user_id_and_song_id  (user_id,song_id) UNIQUE
#
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

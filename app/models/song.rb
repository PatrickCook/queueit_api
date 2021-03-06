# == Schema Information
#
# Table name: songs
#
#  id              :integer          not null, primary key
#  album_image_url :text             not null
#  artist          :text             not null
#  has_played      :boolean          default("0"), not null
#  is_playing      :boolean          default("0"), not null
#  preview_uri     :text
#  spotify_uri     :text             not null
#  title           :text             not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  group_id        :integer          not null
#
# Indexes
#
#  index_songs_on_group_id  (group_id)
#
# create_table "songs", force: :cascade do |t|
#   t.text "title", null: false
#   t.text "artist", null: false
#   t.text "album_image_url", null: false
#   t.text "preview_uri"
#   t.text "spotify_uri", null: false
#   t.boolean "is_playing", default: false, null: false
#   t.boolean "has_played", default: false, null: false
#   t.bigint "group_id", null: false
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.index ["group_id"], name: "index_songs_on_group_id"
# end

class Song < ApplicationRecord
  belongs_to :group
  has_many :votes, dependent: :destroy
end

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
class SongSerializer < ActiveModel::Serializer
  attributes :id,
             :title,
             :artist,
             :album_image_url,
             :spotify_uri,
             :preview_uri,
             :group_id
  has_many :votes
end

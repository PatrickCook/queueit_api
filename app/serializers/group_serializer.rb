# == Schema Information
#
# Table name: groups
#
#  id            :integer          not null, primary key
#  cur_members   :integer          default("0")
#  cur_songs     :integer          default("0")
#  is_playing    :boolean          default("0"), not null
#  is_private    :boolean          default("0"), not null
#  max_members   :integer          default("20")
#  max_songs     :integer          default("20")
#  name          :text             not null
#  password_hash :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  owner_id      :integer
#
# Indexes
#
#  index_groups_on_owner_id  (owner_id)
#
class GroupSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :cur_members,
             :cur_songs,
             :is_playing,
             :is_private,
             :max_members,
             :max_songs,
             :group_image

  def group_image
    song_with_image = object.songs.where("songs.album_image_url IS NOT NULL").first

    return nil unless song_with_image

    song_with_image.album_image_url
  end

  belongs_to :owner, class_name: "User"
  has_many :songs
  has_many :members, class_name: "User"
end

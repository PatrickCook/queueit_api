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
class VoteSerializer < ActiveModel::Serializer
  attributes :song_id, :user_id
end

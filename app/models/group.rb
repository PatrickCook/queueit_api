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
# create_table "group_queues", force: :cascade do |t|
#   t.text "name", null: false
#   t.boolean "is_playing", default: false, null: false
#   t.bigint "user_id"
#   t.integer "cur_members", default: 0
#   t.integer "max_members", default: 20
#   t.integer "cur_songs", default: 0
#   t.integer "max_songs", default: 20
#   t.boolean "is_private", default: false, null: false
#   t.text "password_hash"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.index ["user_id"], name: "index_group_queues_on_user_id"
# end

class Group < ApplicationRecord
  has_many :songs, dependent: :destroy
  belongs_to :owner, class_name: "User"
  has_and_belongs_to_many :members, class_name: "User"

  validates :name, presence: true
  validates :password_hash, presence: true, if: -> { is_private }

  def as_json(options)
    super(:except => [:password_hash])
  end

  def authenticated?(hash)
     self.is_private == false || (self.is_private && self.password_hash == hash)
  end
end

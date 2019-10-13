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
  has_many :songs
  belongs_to :owner, class_name: "User"

  has_and_belongs_to_many :users


  validates :name, presence: true
end

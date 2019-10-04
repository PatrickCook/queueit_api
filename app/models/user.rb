# create_table "users", force: :cascade do |t|
#   t.text "username", null: false
#   t.text "password_hash", null: false
#   t.integer "role", default: 0
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.string "first_name"
#   t.string "last_name"
#   t.index ["username"], name: "index_users_on_username", unique: true
# end

class User < ApplicationRecord
  has_many :group_queues

  validates :username, uniqueness: true, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :role, inclusion: { in: 0..2 } # 0 - default, 1 - admin, 2 - TBD

end

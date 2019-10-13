class User < ApplicationRecord
  has_secure_password

  has_many :votes
  has_many :owned_queues, class_name: "Group", foreign_key: 'owner_id'
  has_and_belongs_to_many :joined_queues, class_name: "Group"

  validates :email, uniqueness: true, presence: true
end

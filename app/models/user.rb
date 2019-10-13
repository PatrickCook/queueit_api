class User < ApplicationRecord
  has_secure_password

  has_many :votes
  has_many :owned_queues, :class_name => :group, foreign_key: 'owner_id'
  has_and_belongs_to_many :groups

  validates :email, uniqueness: true, presence: true
end

# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  name            :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  has_secure_password

  has_many :votes, dependent: :destroy
  has_many :owned_queues, class_name: "Group", foreign_key: 'owner_id'
  has_and_belongs_to_many :joined_queues, class_name: "Group", dependent: :destroy

  validates :email, uniqueness: true, presence: true

  def as_json(options)
    super(:only => [:id, :name])
  end
end

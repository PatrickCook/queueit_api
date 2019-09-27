class User < ApplicationRecord
  has_many :group_queues, dependent: :destroy


end

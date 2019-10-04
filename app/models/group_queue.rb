class GroupQueue < ApplicationRecord
  belongs_to :user
  has_many :songs
  has_and_belongs_to_many :members, class_name: "User"

end

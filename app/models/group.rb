class Group < ActiveRecord::Base
  belongs_to :owner, class_name: "User"
  has_many :memberships
  has_many :members, through: :memberships, source: :user
  has_many :tasks
end

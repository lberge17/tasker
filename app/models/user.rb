class User < ActiveRecord::Base
  has_secure_password
  validates :email, uniqueness: true
  validates :username, uniqueness: true

  has_many :owned_groups, foreign_key: "owner_id", class_name: "Group"
  has_many :memberships
  has_many :groups, through: :memberships
  has_many :assignments, foreign_key: "assigned_id", class_name: "SubTask"
end

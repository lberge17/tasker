class User < ActiveRecord::Base
  has_secure_password
  validates :email, uniqueness: true
  validates :username, uniqueness: true

  has_many :group_users
  has_many :groups, through: :group_users
  has_many :tasks, through: :groups
  has_many :sub_tasks
end

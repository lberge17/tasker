class User < ActiveRecord::Base
  has_secure_password
  has_many :group_users
  has_many :groups, through: :group_users
  has_many :tasks, through: :groups
  has_many :sub_tasks
end

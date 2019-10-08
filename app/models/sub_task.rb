class SubTask < ActiveRecord::Base
  belongs_to :task
  has_one :assigned_to, class_name: "User"
end

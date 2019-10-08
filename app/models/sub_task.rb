class SubTask < ActiveRecord::Base
  belongs_to :task
  belongs_to :assigned, class_name: "User"
end

class SubTask < ActiveRecord::Base
  belongs_to :task
  belongs_to :user #eventually want this to be called "assigned_to" need to add to migrations
end

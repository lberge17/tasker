class Task < ActiveRecord::Base
  belongs_to :group
  has_many :todos
end

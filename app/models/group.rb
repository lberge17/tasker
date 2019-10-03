class Group < ActiveRecord::Base
  has_many :group_users
  has_many :users, through: :group_users
  has_many :tasks

  def slug
    self.name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    Group.all.find{|group| group.slug == slug}
  end

end

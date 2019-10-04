class Group < ActiveRecord::Base
  belongs_to :owner, class_name: "User"
  has_many :memberships
  has_many :members, through: :memberships, source: :user
  has_many :tasks

  def slug
    self.name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    Group.all.find{|group| group.slug == slug}
  end

end

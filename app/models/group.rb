class Group < ActiveRecord::Base

  has_many :targets
  has_many :group_budgets, :dependent => :destroy

  validates_presence_of :name

  scope :attended_by_organization, lambda { |organization| 
    joins(:targets => :projects).
    where("projects.organization_id == ?", organization.to_param).uniq
  }

end

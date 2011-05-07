class Group < ActiveRecord::Base

  has_many :targets
  has_many :group_budgets, :dependent => :destroy
  has_many :projects, :through => :targets

  validates_presence_of :name

  scope :attended_by_organization, lambda { |organization| 
    joins(:targets => :projects).
    where("projects.organization_id == ?", organization.to_param).uniq
  }

  def budget_for_organization(organization)
    total = 0.0
    projects.of_organization(organization).each {|project| total += project.budget }
    total
  end

end

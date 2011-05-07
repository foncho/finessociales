class Group < ActiveRecord::Base

  has_many :targets
  has_many :group_budgets, :dependent => :destroy
  has_many :projects, :through => :targets

  validates_presence_of :name

  delegate :budget, :percentage, :to => :group_budgets, :allow_nil => true

  scope :attended_by_organization, lambda { |organization| 
    joins(:targets => :projects).
    where("projects.organization_id == ?", organization.to_param).uniq
  }

  def budget_for_organization(organization)
    total = 0.0
    projects.of_organization(organization).each {|project| total += project.budget }
    total
  end

  def budget
    group_budgets.empty? ? 0.0 : group_budgets.first.budget
  end

  def percentage
    group_budgets.empty? ? 0.0 : group_budgets.first.percentage
  end

end

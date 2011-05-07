class Group < ActiveRecord::Base

  has_many :targets
  has_many :group_budgets, :dependent => :destroy
  has_many :projects, :through => :targets
  has_many :years, :through => :group_budgets

  validates_presence_of :name

  scope :attended_by_organization, lambda { |organization, year|
    joins(:targets => :projects).
    where("projects.organization_id == ? and projects.year_id == ?", organization.to_param, year.to_param).uniq
  }

  scope :of_year, lambda {}

  def budget_for_organization_year(organization, year)
    total = 0.0
    projects.where(:year_id => year.to_param).of_organization(organization).each {|project| total += project.budget }
    total
  end

  def budget(year)
    group_budgets.empty? ? 0.0 : group_budgets.where(:year_id => year.to_param).first.budget
  end

  def percentage(year)
    group_budgets.empty? ? 0.0 : group_budgets.where(:year_id => year.to_param).first.percentage
  end

end

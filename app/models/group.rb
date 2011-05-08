class Group < ActiveRecord::Base

  has_many :targets
  has_many :group_budgets, :dependent => :destroy
  has_many :projects, :through => :targets
  has_many :years, :through => :group_budgets

  validates_presence_of :name

  scope :attended_by_organization, lambda { |organization, year|
    joins(:targets => :projects).
    where("projects.organization_id = ? and projects.year_id = ?", organization.id, year.id).uniq
  }

  scope :of_year, lambda { |year|
    joins(:group_budgets).
    where("group_budgets.year_id = ?", year.id).uniq
  }

  # friendly-ids
  has_friendly_id :name, :use_slug => true, :approximate_ascii => true, :max_length => 50, :ascii_approximation_options => :spanish

  def budget_for_organization_year(organization, year)
    total = 0.0
    projects.where(:year_id => year.id).of_organization(organization).each {|project| total += project.budget }
    total
  end

  def budget_for_year(year)
    group_budgets.empty? ? 0.0 : group_budgets.where(:year_id => year.id).first.budget
  end

  def percentage(year)
    group_budgets.empty? ? 0.0 : group_budgets.where(:year_id => year.id).first.percentage
  end

end

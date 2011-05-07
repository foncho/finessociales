class Target < ActiveRecord::Base
  
  belongs_to :group
  has_many :target_budgets, :dependent => :destroy
  has_many :projects

  validates_presence_of :name

  scope :of_year, lambda { |year|
    joins(:target_budgets).
    where("target_budgets.year_id == ?", year.to_param).uniq
  }

  def budget_for_organization_year(organization, year)
    total = 0.0
    projects.where(:year_id => year.to_param).of_organization(organization).each {|project| total += project.budget }
    total
  end

  def budget(year)
    target_budgets.empty? ? 0.0 : target_budgets.where(:year_id => year.to_param).first.budget
  end

end

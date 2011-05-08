class Organization < ActiveRecord::Base

  has_many :projects, :dependent => :destroy
  has_many :targets, :through => :projects
  has_many :organization_budgets, :dependent => :destroy
  has_many :years, :through => :organization_budgets

  validates_presence_of :name, :cif
  validates_uniqueness_of :cif

  scope :of_year, lambda { |year|
    joins(:organization_budgets).
    where("organization_budgets.year_id == ?", year.to_param).uniq
  }

  scope :top_by_year, lambda { |year, limit|
    joins(:organization_budgets).
    where("organization_budgets.year_id == ?", year.to_param).order("organization_budgets.budget DESC").limit(limit)
  }

  def budget(year)
    organization_budgets.empty? ? 0.0 : organization_budgets.where(:year_id => year.to_param).first.budget
  end

end

class OrganizationBudget < ActiveRecord::Base

  belongs_to :year
  belongs_to :organization

  validates_presence_of :budget
  validates_associated :organization, :year
  validates_uniqueness_of :year_id, :scope => :organization_id
  
end

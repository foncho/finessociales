class Project < ActiveRecord::Base

  belongs_to :organization
  belongs_to :year
  belongs_to :target

  has_many :groups, :through => :target

  validates_presence_of :title, :budget
  validates_associated :organization, :year

  scope :of_organization, lambda { |organization|
    where("organization_id == ?", organization.to_param)
  }

end

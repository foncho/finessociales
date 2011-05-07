class Project < ActiveRecord::Base

  belongs_to :organization
  belongs_to :year
  belongs_to :target

  validates_presence_of :title, :budget
  validates_associated :organization, :year


end

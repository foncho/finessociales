class Target < ActiveRecord::Base
  
  belongs_to :group

  has_many :projects

  validates_presence_of :name

  def budget_for_organization(organization)
    total = 0.0
    projects.of_organization(organization).each {|project| total += project.budget }
    total
  end

end

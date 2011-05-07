class GroupBudget < ActiveRecord::Base

  belongs_to :year
  belongs_to :group

  validates_presence_of :budget, :percentage
  validates_associated :group, :year
  validates_uniqueness_of :year_id, :scope => :group_id

end

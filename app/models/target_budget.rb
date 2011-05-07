class TargetBudget < ActiveRecord::Base

  belongs_to :year
  belongs_to :target

  validates_presence_of :budget
  validates_associated :target, :year
  validates_uniqueness_of :year_id, :scope => :target_id

end

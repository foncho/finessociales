class Group < ActiveRecord::Base

  has_many :targets
  has_many :group_budgets, :dependent => :destroy

  validates_presence_of :name

end

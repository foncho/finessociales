class Target < ActiveRecord::Base
  
  belongs_to :group

  has_many :projects

  validates_presence_of :name

end

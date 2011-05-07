class Group < ActiveRecord::Base

  has_many :targets

  validates_presence_of :name

end

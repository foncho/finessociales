class Group < ActiveRecord::Base

  validates_presence_of :name, :cif

end

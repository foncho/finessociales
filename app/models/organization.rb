class Organization < ActiveRecord::Base

  has_many :projects, :dependent => :destroy

  validates_presence_of :name, :cif
  validates_uniqueness_of :cif

end

class Project < ActiveRecord::Base

  belongs_to :organization
  belongs_to :year
  belongs_to :target

  has_many :groups, :through => :target

  validates_presence_of :title, :budget
  validates_associated :organization, :year

  scope :target_is, lambda { |target|
    where(:target_id => target.id)
  }

  scope :of_organization, lambda { |organization|
    where(:organization_id => organization.id)
  }

  scope :of_year, lambda { |year|
    where(:year_id => year.id)
  }

  scope :top_by_year, lambda { |year, limit|
    where(:year_id => year.id).order('budget DESC').limit(limit)
  }

  # friendly-ids
  has_friendly_id :title, :use_slug => true, :approximate_ascii => true, :max_length => 50, :ascii_approximation_options => :spanish

end

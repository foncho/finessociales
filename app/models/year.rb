class Year < ActiveRecord::Base

  has_many :projects, :dependent => :destroy

  validates_presence_of :year, :budget, :social_percentage, :foreing_percentage, :environmental_percentage
  validate :check_percentages

  def check_percentages
    total_percentage = social_percentage + foreing_percentage + environmental_percentage
      errors.add(:year, "percentages should sum 100") unless (total_percentage == 100.0)
  end

  def social_budget
    budget * (social_percentage/100)
  end

  def foreing_budget
    budget * (foreing_percentage/100)
  end

  def environmental_budget
    budget * (environmental_percentage/100)
  end

end

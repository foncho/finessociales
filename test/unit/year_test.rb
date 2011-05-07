require 'test_helper'

class YearTest < ActiveSupport::TestCase
  should "be valid" do
    assert Factory.create(:year)
  end

  should "calculate the percentages of the buget" do
    year = Factory.create(:year, :budget => 1000, :social_percentage => 80, :foreing_percentage => 15, :environmental_percentage => 5)
    assert_equal 800, year.social_budget
    assert_equal 150, year.foreing_budget
    assert_equal 50, year.environmental_budget
  end

end

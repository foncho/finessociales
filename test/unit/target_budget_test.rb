require 'test_helper'

class TargetBudgetTest < ActiveSupport::TestCase
  should "be valid" do
    assert Factory.build(:target_budget).valid?
  end

  should "not be valid 2 with the same year and group" do
    year = Factory.create(:year)
    target = Factory.create(:target)
    assert Factory.create(:target_budget, :year => year, :target => target)
    assert !(Factory.build(:target_budget, :year => year, :target => target).valid?)
  end
  
end

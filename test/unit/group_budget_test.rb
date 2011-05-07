require 'test_helper'

class GroupBudgetTest < ActiveSupport::TestCase
  should "be valid" do
    assert Factory.build(:group_budget).valid?
  end

  should "not be valid 2 with the same year and group" do
    year = Factory.create(:year)
    group = Factory.create(:group)
    assert Factory.create(:group_budget, :year => year, :group => group)
    assert !(Factory.build(:group_budget, :year => year, :group => group).valid?)
  end

end

require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  should "be valid" do
    assert Factory.build(:group).valid?
  end

  should "have many group budgets" do
    group = Factory.create(:group)
    assert_equal 0, group.group_budgets.count
    Factory.create(:group_budget, :group => group)
    assert_equal 1, group.group_budgets.count
  end
end

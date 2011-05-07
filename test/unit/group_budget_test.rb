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

  should "calculate the total budget of all the projects of the group of an organization" do
    year = Factory.create(:year)
    organization = Factory.create(:organization)
    group = Factory.create(:group)
    target1 = Factory.create(:target, :group => group)
    Factory.create(:project, :target => target1, :organization => organization, :budget => 100.0, :year => year)
    Factory.create(:project, :target => target1, :organization => organization, :budget => 200.0, :year => year)
    Factory.create(:project, :target => target1, :budget => 800.0, :year => year)
    target2 = Factory.create(:target, :group => group)
    Factory.create(:project, :target => target2, :organization => organization, :budget => 300.0, :year => year)
    Factory.create(:project, :target => target2, :budget => 800.0, :year => year)

    assert_equal 600.0, group.budget_for_organization_year(organization, year)
  end

end

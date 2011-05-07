require 'test_helper'

class TargetTest < ActiveSupport::TestCase
  should "be valid" do
    assert Factory.build(:target).valid?
  end

  should "have many projects" do
    target = Factory.create(:target)
    assert_equal 0, target.projects.count
    Factory.create(:project, :target => target)
    assert_equal 1, target.projects.count
  end

  should "calculate the total budget of all the projects of the target of an organization" do
    organization = Factory.create(:organization)
    target = Factory.create(:target)
    Factory.create(:project, :target => target, :organization => organization, :budget => 100.0)
    Factory.create(:project, :target => target, :organization => organization, :budget => 200.0)
    Factory.create(:project, :target => target, :budget => 800.0)

    assert_equal 300.0, target.budget_for_organization(organization)
  end

end

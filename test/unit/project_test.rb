require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  should "be valid" do
    assert Factory.build(:project).valid?
  end

  should "have a year" do
    year = Factory.create(:year)
    project = Factory.create(:project, :year => year)
    assert_equal year, project.year
  end

  should "have an organization" do
    organization = Factory.create(:organization)
    project = Factory.create(:project, :organization => organization)
    assert_equal organization, project.organization
  end

  should "have a target" do
    target = Factory.create(:target)
    project = Factory.create(:project, :target => target)
    assert_equal target, project.target
  end

end

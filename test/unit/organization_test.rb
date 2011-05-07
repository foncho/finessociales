require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase
  should "be valid" do
    assert Factory.build(:organization).valid?
  end

  should "have many projects" do
    organization = Factory.create(:organization)
    assert_equal 0, organization.projects.count
    Factory.create(:project, :organization => organization)
    assert_equal 1, organization.projects.count
  end

end

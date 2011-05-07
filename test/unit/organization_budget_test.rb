require 'test_helper'

class OrganizationBudgetTest < ActiveSupport::TestCase
  should "be valid" do
    assert Factory.build(:organization_budget).valid?
  end

  should "not be valid 2 with the same year and group" do
    year = Factory.create(:year)
    organization = Factory.create(:organization)
    assert Factory.create(:organization_budget, :year => year, :organization => organization)
    assert !(Factory.build(:organization_budget, :year => year, :organization => organization).valid?)
  end
end

require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase
  should "be valid" do
    assert Factory.build(:organization).valid?
  end
end

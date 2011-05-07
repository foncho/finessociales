require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  should "be valid" do
    assert Factory.build(:group).valid?
  end
end

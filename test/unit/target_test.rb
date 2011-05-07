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
end

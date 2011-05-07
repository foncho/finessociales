require 'test_helper'

class TargetTest < ActiveSupport::TestCase
  should "be valid" do
    assert Target.new.valid?
  end
end

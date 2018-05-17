require 'test_helper'

class UserTest < ActiveSupport::TestCase
   test "cannot save user without email address" do
    u = User.new name: "User"
    assert !u.save, "Houston, we have a problem"
  end

  test "cannot save user with existing email address" do
    u = User.new name: "User", email: 'ebedelek@gmail.com'
    assert !u.save
  end
end

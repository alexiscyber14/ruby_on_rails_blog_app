require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should not save user without name" do
    user = User.new
    assert_not user.save, "Saved the user without a name"
  end

  test "should save user with valid attributes" do
    user = User.new(name: "John Doe", post_counter: 0)
    assert user.save, "Could not save the user with valid attributes"
  end
end

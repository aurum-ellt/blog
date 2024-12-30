require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
  end

  test "should not save user without email address" do
    @user.email_address = nil
    assert_not @user.save
  end

  test "should not save user if email address already exists" do
    duplicate_user = User.new(email_address: @user.email_address)
    assert_not duplicate_user.save
  end

  test "should not save user if password length less than 8" do
    @user.password_digest = BCrypt::Password.create("passwor")
    assert_not @user.save
  end

  test "should not update user without pseudo" do
    @user.pseudo = nil
    assert_not @user.save
  end

  test "should not save user if pseudo length more than 34" do
    @user.pseudo = "Lorem ipsum odor amet, consectetuer adipiscing elit"
    assert_not @user.save
  end
end

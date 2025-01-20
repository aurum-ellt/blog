require "test_helper"

class IdentityTest < ActiveSupport::TestCase
  setup do
    @indentity = identities(:one)
  end

  test "should not save indentity without provider uid" do
    @indentity.provider_uid = nil
    assert_not @indentity.save
  end

  test "should not save indentity without provider name" do
    @indentity.provider_name = nil
    assert_not @indentity.save
  end

  test "should not save indentity without user" do
    @indentity.user = nil
    assert_not @indentity.save
  end
end

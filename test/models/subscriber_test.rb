require "test_helper"

class SubscriberTest < ActiveSupport::TestCase
  setup do
    @subscriber = subscribers(:one)
  end

  test "should not save subscriber without email address" do
    @subscriber.email_address = nil
    assert_not @subscriber.save
  end

  test "should not save subscriber without token" do
    @subscriber.token = nil
    assert_not @subscriber.save
  end
end

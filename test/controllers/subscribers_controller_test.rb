require "test_helper"

class SubscribersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subscriber = subscribers(:one)
  end

  test "should create subscriber" do
    assert_difference -> { Subscriber.count }, 1 do
      post author_subscribers_url(@subscriber.user.slug), params: { subscriber: { email_address: "subscriber@example.com" } }
    end

    assert_equal "Subscriber was successfully created.", flash[:notice]
  end

  test "should confirmed subscriber" do
    get author_subscriber_confirmed_url(@subscriber.user.slug, @subscriber.token)
    assert_response :success

    @subscriber.reload
    assert @subscriber.confirmed?
  end

  test "should destroy subscriber" do
    assert_difference -> { Subscriber.count }, -1 do
      get author_subscriber_unsubscribe_url(@subscriber.user.slug, @subscriber.token)
    end

    assert_response :success
  end
end

require "test_helper"

class SubscribersMailerTest < ActionMailer::TestCase
  test "confirm" do
    subscriber = subscribers(:one)
    email = SubscribersMailer.confirm(subscriber, subscriber.user)

    assert_emails 1 do
      email.deliver_later
    end

    assert_equal [ "from@example.com" ], email.from
    assert_equal [ subscriber.email_address ], email.to
    assert_equal "Please confirm your subscription to #{subscriber.user.name}", email.subject
  end
end

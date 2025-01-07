require "test_helper"

class PostsMailerTest < ActionMailer::TestCase
  test "broadcast" do
    post = posts(:two)
    email = PostsMailer.broadcast(post)

    assert_emails 1 do
      email.deliver_later
    end

    assert_equal [ "from@example.com" ], email.from
    assert_equal post.user.subscribers.pluck(:email_address), email.to
    assert_equal post.title, email.subject
  end
end

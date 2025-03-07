require "test_helper"

class Posts::BroadcastsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in_as users(:one)
  end

  test "should broadcast post" do
    post = posts(:two)

    assert_emails 1 do
      post post_broadcasts_url(post)
    end

    assert_redirected_to author_post_url(post.user.slug, post.slug)
  end

  test "should forbid broadcast for unpublished post" do
    post = posts(:one)

    post post_broadcasts_url(post)
    assert_response :forbidden
  end
end

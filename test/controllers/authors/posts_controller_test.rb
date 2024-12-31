require "test_helper"

class Authors::PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    user = users(:one)
    get author_posts_url(user.slug)
    assert_response :success
  end

  test "should show published post" do
    post = posts(:two)

    get author_post_url(post.user.slug, post.slug)
    assert_response :success
  end

  test "should show post for authorized user" do
    post = posts(:one)
    sign_in users(:one)

    get author_post_url(post.user.slug, post.slug)
    assert_response :success
  end

  test "should forbid show for unauthorized user when not published" do
    post = posts(:four)
    sign_in users(:one)

    get author_post_url(post.user.slug, post.slug)
    assert_response :forbidden
  end
end

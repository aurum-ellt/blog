require "test_helper"

class Authors::PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
  end

  test "should get index" do
    get author_posts_url(@post.user.slug)
    assert_response :success
  end

  test "should show post" do
    get author_post_url(@post.user.slug, @post.slug)
    assert_response :success
  end
end

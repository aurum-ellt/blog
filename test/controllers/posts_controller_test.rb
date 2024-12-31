require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
  end

  test "should get new" do
    get new_post_url
    assert_response :success
  end

  test "should create post" do
    assert_difference -> { Post.count }, 1 do
      post posts_url, params: { post: { title: "Interdum iaculis", body: "Interdum iaculis etiam efficitur etiam est ligula euismod." } }
    end

    post = Post.last
    assert_equal "Interdum iaculis", post.title
    assert_equal "Interdum iaculis etiam efficitur etiam est ligula euismod.", post.body.to_plain_text

    assert_redirected_to post_url(Post.last)
  end

  test "should get edit" do
    post = posts(:one)
    get edit_post_url(post)
    assert_response :success
  end

  test "should forbid edit for unauthorized user" do
    post = posts(:four)
    get edit_post_url(post)
    assert_response :forbidden
  end

  test "should update post" do
    post = posts(:one)

    patch post_url(post), params: { post: { title: "Mauris ipsum", body: "Mauris ipsum venenatis euismod in ligula." } }
    assert_redirected_to post_url(post)

    post = Post.order(:updated_at).last
    assert_equal "Mauris ipsum", post.title
    assert_equal "Mauris ipsum venenatis euismod in ligula.", post.body.to_plain_text
  end

  test "should forbid update for unauthorized user" do
    post = posts(:four)

    patch post_url(post), params: { post: { title: "Mauris ipsum", body: "Mauris ipsum venenatis euismod in ligula." } }
    assert_response :forbidden

    post = Post.order(:updated_at).last
    assert_not_equal "Mauris ipsum", post.title
    assert_not_equal "Mauris ipsum venenatis euismod in ligula.", post.body.to_plain_text
  end

  test "should destroy post" do
    post = posts(:one)

    assert_difference -> { Post.count }, -1 do
      delete post_url(post)
    end

    assert_redirected_to posts_url
  end

  test "should forbid destroy for unauthorized user" do
    post = posts(:four)

    assert_no_difference -> { Post.count } do
      delete post_url(post)
    end

    assert_response :forbidden
  end
end

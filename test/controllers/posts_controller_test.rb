require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in_as users(:one)
  end

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

    get author_post_url(post.user.slug, post.slug)
    assert_response :success
  end

  test "should forbid show for unauthorized user when not published" do
    post = posts(:four)

    get author_post_url(post.user.slug, post.slug)
    assert_response :forbidden
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

    assert_redirected_to author_post_path(post.user.slug, post.slug)
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
    assert_redirected_to author_post_path(post.user.slug, post.slug)

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

    assert_redirected_to author_posts_url(post.user.slug)
  end

  test "should forbid destroy for unauthorized user" do
    post = posts(:four)

    assert_no_difference -> { Post.count } do
      delete post_url(post)
    end

    assert_response :forbidden
  end
end

require "test_helper"

class PostTest < ActiveSupport::TestCase
  setup do
    @post = posts(:one)
  end

  test "should not save post if slug already exists" do
    duplicate_post = Post.new(slug: @post.slug)
    assert_not duplicate_post.save
  end

  test "should not save post without title" do
    @post.title = nil
    assert_not @post.save
  end

  test "should not save post without status" do
    @post.status = nil
    assert_not @post.save
  end

  test "should not save post without user" do
    @post.user = nil
    assert_not @post.save
  end
end

require "test_helper"

class PostTest < ActiveSupport::TestCase
  setup do
    @post = posts(:one)
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

  test "should not publish post without user name" do
    @post.status = "published"
    @post.user.name = nil
    assert_not @post.valid?
  end
end

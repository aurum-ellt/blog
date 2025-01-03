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

  test "should touch published at if status changed to published" do
    @post.status = :published
    @post.save
    assert_not_nil @post.published_at
  end
end

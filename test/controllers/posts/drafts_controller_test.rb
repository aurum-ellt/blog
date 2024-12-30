require "test_helper"

class Posts::DraftsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
  end

  test "should get index" do
    get drafts_url
    assert_response :success
  end
end

require "test_helper"

class Posts::ArchivesControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
  end

  test "should get index" do
    get archives_url
    assert_response :success
  end
end

require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
  end

  test "should get edit" do
    get edit_user_url
    assert_response :success
  end

  test "should get update" do
    patch user_url, params: { user: { pseudo: "Lorem ipsum", bio: "Lorem ipsum odor amet, consectetuer adipiscing elit." } }
    assert_redirected_to edit_user_url

    user = User.order(:updated_at).last
    assert_equal "Lorem ipsum", user.pseudo
    assert_equal "Lorem ipsum odor amet, consectetuer adipiscing elit.", user.bio
  end

  test "should destroy user" do
    assert_difference -> { User.count }, -1 do
      delete user_url
    end

    assert_redirected_to root_path
  end
end

require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_session_url
    assert_response :success
  end

  test "should create session" do
    user = users(:one)

    assert_difference -> { Session.count }, 1 do
      post session_url, params: { email_address: user.email_address, password: "password" }
    end

    assert_redirected_to root_path
  end

  test "should not create session with invalid credentials" do
    user = users(:one)
    sign_in user, password: "wrong_password"

    assert_redirected_to new_session_url
    assert_equal "Try another email address or password.", flash[:alert]
  end

  test "should destroy session" do
    delete session_url
    assert_redirected_to new_session_url
  end
end

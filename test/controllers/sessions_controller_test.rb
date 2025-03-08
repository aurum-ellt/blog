require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup { @user = User.take }

  test "should get new" do
    get new_session_url
    assert_response :success
  end

  test "should redirect to root path if user is authenticated" do
    sign_in_as @user

    get new_session_url
    assert_redirected_to root_path
  end

  test "should create session" do
    assert_difference -> { Session.count }, 1 do
      post session_url, params: { email_address: @user.email_address, password: "password" }
    end

    assert_redirected_to root_path
    assert cookies[:session_id]
  end

  test "should not create session with invalid credentials" do
    post session_url, params: { email_address: @user.email_address, password: "wrong_password" }

    assert_redirected_to new_session_url
    assert_equal "Try another email address or password.", flash[:alert]
    assert_nil cookies[:session_id]
  end

  test "should destroy session" do
    sign_in_as @user

    delete session_url
    assert_redirected_to new_session_url
    assert_empty cookies[:session_id]
  end
end

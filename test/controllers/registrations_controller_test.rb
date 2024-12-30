require "test_helper"

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_registration_url
    assert_response :success
  end

  test "should create user" do
    assert_difference -> { User.count }, 1 do
      post registration_url, params: { user: { email_address: "registration@example.com", password: BCrypt::Password.create("password") } }
    end

    assert_redirected_to root_path
  end
end

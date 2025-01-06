require "test_helper"

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_registration_url
    assert_response :success
  end

  test "should redirect to root path if user is authenticated" do
    sign_in users(:one)

    get new_registration_url
    assert_redirected_to root_path
  end

  test "should create user" do
    assert_difference -> { User.count }, 1 do
      post registration_url, params: { user: { email_address: "registration@example.com", name: "Lorem ipsum", password: BCrypt::Password.create("password") } }
    end

    assert_redirected_to root_path
  end
end

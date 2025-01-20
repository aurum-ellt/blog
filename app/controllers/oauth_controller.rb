class OauthController < ApplicationController
  allow_unauthenticated_access

  def new
    authorize_url = oauth_client.auth_code.authorize_url(
      redirect_uri: callback_oauth_url,
      scope: "openid email profile",
      access_type: "online",
    )

    redirect_to authorize_url, allow_other_host: true
  end

  def create
    @identity = Identity.find_or_initialize_by(provider_name: user_params[:provider_name], provider_uid: user_params[:provider_uid]) do |identity|
      identity.user = User.new(email_address: user_params[:email_addres], password: SecureRandom.hex(16))
    end

    if @identity.save
      start_new_session_for(user)
      redirect_to root_path, notice: "Signed up successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def oauth_client
    @oauth_client ||= OAuth2::Client.new(
      Rails.application.credentials.dig(:google_oauth, :client_id),
      Rails.application.credentials.dig(:google_oauth, :client_secret),
      {
        site: "https://accounts.google.com",
        authorize_url: "/o/oauth2/auth"
      }
    )
  end

  def user_params
    @user_params ||= {}.tap do |user|
      token = token_client.auth_code.get_token(params[:code], redirect_uri: oauth_url)
      user_info = JSON.parse(token.get("https://openidconnect.googleapis.com/v1/userinfo").body)

      user[:provider_uid] = user_info["sub"]
      user[:provider_name] = "Google"
      user[:email_address] = user_info["email"]
    end
  end
end

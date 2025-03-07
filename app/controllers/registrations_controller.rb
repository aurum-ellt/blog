class RegistrationsController < ApplicationController
  allow_unauthenticated_access
  rate_limit to: 10, within: 3.minutes, only: :create, with: -> { redirect_to new_session_url, alert: "Try again later." }

  def new
    redirect_to root_path if authenticated?
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      start_new_session_for @user
      redirect_to root_path, notice: "Signed up successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def user_params
      params.expect(user: [ :email_address, :name, :password ])
    end
end

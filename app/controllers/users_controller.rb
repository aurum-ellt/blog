class UsersController < ApplicationController
  before_action :set_user, only: %i[ edit update destroy ]

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to edit_user_path, notice: "User was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy!
    redirect_to root_path, notice: "User was successfully destroyed.", status: :see_other
  end

  private
    def set_user
      @user = Current.user
    end

    def user_params
      params.expect(user: [ :avatar, :name, :bio ])
    end
end

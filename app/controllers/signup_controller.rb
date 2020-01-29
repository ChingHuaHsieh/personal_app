class SignupController < ApplicationController

  before_action :authenticate_user!, only: [:done]
  before_action :redirect_to_userinfo, only: :index

  def index
  end

  def registration
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user unless user_signed_in?
      redirect_to action: 'done'
    else
      render action: 'registration' unless @user.valid?
    end
  end

  def done
  end

private
  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password,
      :password_confirmation,
      :mother_language_id,
      :learning_language_id
    )
  end

  def redirect_to_userinfo
    if user_signed_in?
      redirect_to user_info_post_path(current_user.id)
    end
  end
end

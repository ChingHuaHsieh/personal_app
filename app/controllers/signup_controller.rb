class SignupController < ApplicationController

  before_action :authenticate_user!, only: [:done]

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
      render registration_signup_index_path unless @user.valid?
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
      :learning_language_id,
      :site_language_id
    )
  end
end

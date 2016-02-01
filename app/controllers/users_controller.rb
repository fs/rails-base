class UsersController < ApplicationController
  before_action :authenticate_user!, only: :home

  expose(:user, attributes: :user_params)

  def home
  end

  def finish_signup
    return false unless request.patch?

    user.update_attributes(user_params) ? sign_in_user : render_errors
  end

  private

  def user_params
    params.require(:user).permit(%i(full_name email password))
  end

  def sign_in_user
    confirm_user
    sign_in(user, bypass: true)
    redirect_to root_path, notice: "Welcome!"
  end

  def render_errors
    render :finish_signup
  end

  def confirm_user
    if session[:auth_verified?]
      session[:auth_verified?] = nil
      user.update_attribute(:confirmed_at, Time.zone.now)
    else
      user.send_confirmation_instructions
    end
  end
end

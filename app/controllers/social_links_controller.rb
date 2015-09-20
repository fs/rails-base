class SocialLinksController < ApplicationController
  def index
    @social_links = current_user.social_links if current_user
  end

  def create
    omniauth = request.env["omniauth.auth"]
    social_link = SocialLink.where(provider: omniauth['provider'], uid: omniauth['uid']).first

    if social_link
      flash[:notice] = "Signed in successfully."
      sign_in_and_redirect(:user, social_link.user)
    elsif current_user
      current_user.social_links.create(provider: omniauth['provider'], uid: omniauth['uid'])
      flash[:notice] = "Successfully created social link."
      redirect_to social_links_url
    else
      user = User.new(email: omniauth.info.email, full_name: omniauth.info.name, password: '123456')
      user.social_links.build(provider: omniauth['provider'], uid: omniauth['uid'])
      user.skip_confirmation!
      if user.save(validate: false)
        flash[:notice] = "Signed in successfully."
        sign_in_and_redirect(:user, user)
      else
        session[:omniauth] = omniauth.except('extra')
        redirect_to new_user_registration_url
      end
    end
  end

  def destroy
    social_link = current_user.social_links.find(params[:id])
    social_link.destroy
    flash[:notice] = "Successfully destroyed social link."
    redirect_to social_links_url
  end
end

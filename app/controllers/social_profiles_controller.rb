class SocialProfilesController < ApplicationController
  before_action :authenticate_user!

  expose(:social_profiles) { current_user.social_profiles }
  expose(:social_profile)

  def destroy
    if social_profile.destroy
      flash[:notice] = t "flash.actions.destroy.notice", resource_name: resource_name
    else
      flash[:alert] = t "flash.actions.destroy.alert", resource_name: resource_name
    end
    redirect_to edit_user_registration_url
  end

  private

  def resource_name
    SocialProfile.model_name.human
  end
end

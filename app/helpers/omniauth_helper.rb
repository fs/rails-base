module OmniauthHelper
  def provider_name(provider)
    t "active_record.attributes.social_profile.provider_name.#{provider}"
  end
end

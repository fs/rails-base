require "rails_helper"

feature "Add/Remove social profiles" do
  let(:user) { create(:user, :confirmed) }
  let(:user_attributes) { user.attributes.slice(:full_name, :email) }
  let(:oauth) { omniauth_mock(provider, "12345", user_attributes) }
  let(:authentication_message) { "Successfully authenticated from #{provider_name} account." }
  let(:unlink_message) { "Social profile was successfully destroyed." }
  let(:unauthorize_link) { find(:css, ".js-unauthorize") }
  let(:provider_name) { I18n.t("active_record.attributes.social_profile.provider_name.#{provider}") }

  before do
    stub_omniauth(provider, oauth)
    allow_any_instance_of(AuthVerificationPolicy).to receive(:verified?)

    login_as user
    visit edit_user_registration_path
  end

  context "when provider is Facebook" do
    let(:provider) { :facebook }

    scenario "user adds social profile" do
      expect(page).not_to have_providers_list(provider_name)

      click_link provider_name
      expect(page).to have_text(authentication_message)
      expect(page).to have_providers_list(provider_name)

      unauthorize_link.click
      expect(page).to have_text(unlink_message)
      expect(page).not_to have_providers_list(provider_name)
    end
  end

  context "when provider is Google" do
    let(:provider) { :google_oauth2 }

    scenario "user adds social profile" do
      expect(page).not_to have_providers_list(provider_name)

      click_link provider_name
      expect(page).to have_text(authentication_message)
      expect(page).to have_providers_list(provider_name)

      unauthorize_link.click
      expect(page).to have_text(unlink_message)
      expect(page).not_to have_providers_list(provider_name)
    end
  end

  # rubocop:disable Style/PredicateName
  def have_providers_list(provider)
    have_text("Successfully authorized via:")
    have_css(".js-social-profiles", text: provider)
  end
  # rubocop:enable Style/PredicateName
end

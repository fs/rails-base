require "rails_helper"

feature "Add/Remove social profiles" do
  let(:user) { create(:user, :confirmed) }
  let(:user_attributes) { user.attributes.slice(:full_name, :email) }
  let(:oauth) { omniauth_mock(provider, "12345", user_attributes) }

  before do
    stub_omniauth(provider, oauth)
    allow(AuthVerificationPolicy).to receive(:verified?)

    login_as user
    visit edit_user_registration_path
  end

  context "when provider is Facebook" do
    let(:provider) { :facebook }

    scenario "user adds social profile" do
      expect(page).to have_link("Facebook")
      expect(page).not_to have_content("Successfully authorized via:")

      click_link "Facebook"
      expect(page).to have_content(I18n.t "devise.omniauth_callbacks.success", kind: "Facebook")
      expect(page).to have_content("Successfully authorized via:")
      expect(page).to have_css(".js-social-profiles", text: "Facebook")

      find(:css, ".js-unauthorize").click
      expect(page).to have_content(I18n.t "flash.actions.destroy.notice", resource_name: social_profile_name)
      expect(page).not_to have_content("Successfully authorized via:")
    end
  end

  context "when provider is Google" do
    let(:provider) { :google_oauth2 }

    scenario "user adds social profile" do
      expect(page).to have_link("Google")
      expect(page).not_to have_content("Successfully authorized via:")

      click_link "Google"
      expect(page).to have_content(I18n.t "devise.omniauth_callbacks.success", kind: "Google")
      expect(page).to have_content("Successfully authorized via:")
      expect(page).to have_css(".js-social-profiles", text: "Google")

      find(:css, ".js-unauthorize").click
      expect(page).to have_content(I18n.t "flash.actions.destroy.notice", resource_name: social_profile_name)
      expect(page).not_to have_content("Successfully authorized via:")
    end
  end

  def social_profile_name
    SocialProfile.model_name.human
  end
end

require "rails_helper"

feature "Add/Remove social profiles" do
  let(:uid) { "12345" }
  let(:user) { create(:user, :confirmed) }
  let(:user_attributes) { user.attributes.slice(:full_name, :email) }
  let(:omniauth_params) { omniauth_mock(provider, uid, user_attributes) }

  before do
    stub_omniauth(provider, omniauth_params)
    allow(CheckOmniauth).to receive(:verified?).and_return(verified)

    login_as user
    visit edit_user_registration_path
  end

  context "when social account is verified" do
    let(:verified) { true }

    context "when provider is Facebook" do
      let(:provider) { :facebook }

      scenario "user adds social profile" do
        expect(page).to have_link("Facebook")
        expect(page).not_to have_content("Linked social networks")

        click_link "Facebook"
        expect(page).to have_content(I18n.t "flash.when_current_user")
        expect(page).to have_content("Linked social networks")
        expect(page).to have_css(".js-social-profiles", text: "Facebook")

        click_link "Facebook"
        expect(page).to have_content(I18n.t "flash.when_current_user_and_social_profile")

        click_link "x"
        expect(page).to have_content(I18n.t "flash.actions.destroy.notice", resource_name: social_profile_name)
        expect(page).not_to have_content("Linked social networks")
      end
    end

    context "when provider is Google" do
      let(:provider) { :google_oauth2 }

      scenario "user adds social profile" do
        expect(page).to have_link("Google")
        expect(page).not_to have_content("Linked social networks")

        click_link "Google"
        expect(page).to have_content(I18n.t "flash.when_current_user")
        expect(page).to have_content("Linked social networks")
        expect(page).to have_css(".js-social-profiles", text: "Google")

        click_link "Google"
        expect(page).to have_content(I18n.t "flash.when_current_user_and_social_profile")

        click_link "x"
        expect(page).to have_content(I18n.t "flash.actions.destroy.notice", resource_name: social_profile_name)
        expect(page).not_to have_content("Linked social networks")
      end
    end
  end

  context "when social account is not verified" do
    let(:verified) { false }

    context "when provider is Facebook" do
      let(:provider) { :facebook }

      scenario "user not able to add social profile" do
        expect(page).to have_link("Facebook")
        expect(page).not_to have_content("Linked social networks")

        click_link "Facebook"
        expect(page).to have_content(I18n.t "flash.social_profile_not_verified")
        expect(page).not_to have_content("Linked social networks")
        expect(page).not_to have_css(".js-social-profiles", text: "Facebook")
      end
    end

    context "when provider is Google" do
      let(:provider) { :google_oauth2 }

      scenario "user not able to add social profile" do
        expect(page).to have_link("Google")
        expect(page).not_to have_content("Linked social networks")

        click_link "Google"
        expect(page).to have_content(I18n.t "flash.social_profile_not_verified")
        expect(page).not_to have_content("Linked social networks")
        expect(page).not_to have_css(".js-social-profiles", text: "Google")
      end
    end
  end

  def social_profile_name
    SocialProfile.model_name.human
  end
end

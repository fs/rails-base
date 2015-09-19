require "rails_helper"

feature "Sign Up" do
  let(:uid) { "12345" }
  let(:user_attributes) { attributes_for(:user).slice(:full_name, :email, :password, :password_confirmation) }
  let(:registered_user) { User.find_by_email(user_attributes[:email]) }
  let(:omniauth_params) { omniauth_mock(provider, uid, user_attributes) }

  before { stub_omniauth(provider, omniauth_params) }

  context "when user and social profile not exist" do
    before { visit root_path }

    context "when provider is Google" do
      let(:provider) { :google_oauth2 }

      scenario "Visitor signs up through provider" do
        click_link "Sign in with Google"

        expect(page).to have_content(I18n.t "flash.when_first_visit")
        expect(page).to have_text(registered_user.email)
      end
    end

    context "when provider is Facebook" do
      let(:provider) { :facebook }

      scenario "Visitor signs up through provider" do
        click_link "Sign in with Facebook"

        expect(page).to have_content(I18n.t "flash.when_first_visit")
        expect(page).to have_text(registered_user.email)
      end
    end
  end

  context "when user and social profile exist" do
    let(:user) { create(:user, :confirmed, user_attributes) }

    before do
      user.social_profiles.create(provider: provider, uid: uid)
      visit root_path
    end

    context "when provider is Google" do
      let(:provider) { :google_oauth2 }

      scenario "Visitor signs in through provider" do
        click_link "Sign in with Google"

        expect(page).to have_content(I18n.t "flash.when_social_profile")
        expect(page).to have_text(registered_user.email)
      end
    end

    context "when provider is Facebook" do
      let(:provider) { :facebook }

      scenario "Visitor signs in through provider" do
        click_link "Sign in with Facebook"

        expect(page).to have_content(I18n.t "flash.when_social_profile")
        expect(page).to have_text(registered_user.email)
      end
    end
  end
end

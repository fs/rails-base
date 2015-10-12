require "rails_helper"

feature "Sign Up" do
  let(:uid) { "12345" }
  let(:registered_user) { User.find_by_email(user_attributes[:email]) }
  let(:omniauth_params) { omniauth_mock(provider, uid, user_attributes) }

  let(:user_attributes) do
    ActiveSupport::HashWithIndifferentAccess.new(
      attributes_for(:user).slice(:full_name, :email, :password, :password_confirmation)
    )
  end

  before do
    stub_omniauth(provider, omniauth_params)
    allow(CheckOmniauth).to receive(:verified?).and_return(verified)

    visit root_path
  end

  context "when social account is verified" do
    let(:verified) { true }

    context "when user and social profile not exist" do
      context "when provider is Google" do
        let(:provider) { :google_oauth2 }

        scenario "Visitor signs up through provider" do
          click_link "Sign in with Google"
          expect(page).to have_field("user_full_name", with: user_attributes[:full_name])
          expect(page).to have_field("user_email", with: user_attributes[:email])

          fill_in "user_password", with: user_attributes[:password]
          fill_in "user_password_confirmation", with: user_attributes[:password_confirmation]
          click_button "Sign up"

          expect(page).to have_content(I18n.t "devise.registrations.signed_up")
          expect(page).to have_text(registered_user.email)
        end
      end

      context "when provider is Facebook" do
        let(:provider) { :facebook }

        scenario "Visitor signs up through provider" do
          click_link "Sign in with Facebook"
          expect(page).to have_field("user_full_name", with: user_attributes[:full_name])
          expect(page).to have_field("user_email", with: user_attributes[:email])

          fill_in "user_password", with: user_attributes[:password]
          fill_in "user_password_confirmation", with: user_attributes[:password_confirmation]
          click_button "Sign up"

          expect(page).to have_content(I18n.t "devise.registrations.signed_up")
          expect(page).to have_text(registered_user.email)
        end
      end
    end

    context "when user and social profile exist" do
      let(:user) { create(:user, :confirmed, user_attributes) }

      before do
        user.social_profiles.create(provider: provider, uid: uid)
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

  context "when social account is not verified" do
    let(:verified) { false }

    context "when provider is Google" do
      let(:provider) { :google_oauth2 }

      scenario "Visitor not able to sign up through provider" do
        click_link "Sign in with Google"

        expect(page).to have_content(I18n.t "flash.social_profile_not_verified")
        expect(page).not_to have_text(user_attributes[:email])
      end
    end

    context "when provider is Facebook" do
      let(:provider) { :facebook }

      scenario "Visitor not able to sign up through provider" do
        click_link "Sign in with Facebook"

        expect(page).to have_content(I18n.t "flash.social_profile_not_verified")
        expect(page).not_to have_text(user_attributes[:email])
      end
    end
  end
end

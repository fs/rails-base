require "rails_helper"

feature "Sign Up" do
  let(:registered_user) { User.find_by_email(user_attributes[:email]) }
  let(:oauth) { omniauth_mock(provider, "12345", user_attributes) }
  let(:user_attributes) { attributes_for(:user).slice(:full_name, :email, :password, :password_confirmation) }

  before do
    stub_omniauth(provider, oauth)
    allow(AuthVerificationPolicy).to receive(:verified?).and_return(verified)

    visit root_path
  end

  context "when user is not persisted" do
    let(:verified) { true }

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

  context "when user is persisted" do
    let(:verified) { true }

    before { create(:user, user_attributes) }

    context "when provider is Google" do
      let(:provider) { :google_oauth2 }

      scenario "Visitor signs in through provider" do
        click_link "Sign in with Google"

        expect(page).to have_content(I18n.t "devise.omniauth_callbacks.success", kind: "Google")
        expect(page).to have_text(registered_user.email)
      end
    end

    context "when provider is Facebook" do
      let(:provider) { :facebook }

      scenario "Visitor signs in through provider" do
        click_link "Sign in with Facebook"

        expect(page).to have_content(I18n.t "devise.omniauth_callbacks.success", kind: "Facebook")
        expect(page).to have_text(registered_user.email)
      end
    end
  end

  context "when oauth can't be used for authentication" do
    let(:verified) { false }

    context "when provider is Google" do
      let(:provider) { :google_oauth2 }

      scenario "Visitor not able to sign up through provider" do
        click_link "Sign in with Google"

        expect(page).to have_content(I18n.t "omniauth.verification.failure", kind: "Google")
        expect(page).not_to have_text(user_attributes[:email])
      end
    end

    context "when provider is Facebook" do
      let(:provider) { :facebook }

      scenario "Visitor not able to sign up through provider" do
        click_link "Sign in with Facebook"

        expect(page).to have_content(I18n.t "omniauth.verification.failure", kind: "Facebook")
        expect(page).not_to have_text(user_attributes[:email])
      end
    end
  end
end

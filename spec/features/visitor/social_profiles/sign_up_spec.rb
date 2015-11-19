require "rails_helper"

feature "Sign Up" do
  let(:registered_user) { User.find_by_email(user_attributes[:email]) }
  let(:oauth) { omniauth_mock(provider, "12345", user_attributes) }
  let(:user_attributes) { attributes_for(:user).slice(:full_name, :email, :password, :password_confirmation) }
  let(:provider_name) { I18n.t("active_record.attributes.social_profile.provider_name.#{provider}") }

  before do
    stub_omniauth(provider, oauth)
    allow_any_instance_of(AuthVerificationPolicy).to receive(:verified?).and_return(verified)

    visit root_path
  end

  context "when user is not persisted" do
    let(:verified) { true }
    let(:success_message) { "You have signed up successfully." }

    context "when provider is Google" do
      let(:provider) { :google_oauth2 }

      scenario "Visitor signs up through provider" do
        click_link "Sign in with Google"
        expect(page).to have_prefilled_fields(user_attributes)

        fill_profile_with(user_attributes)
        expect(page).to have_text(success_message)
        expect(page).to have_text(registered_user.email)
      end
    end

    context "when provider is Facebook" do
      let(:provider) { :facebook }

      scenario "Visitor signs up through provider" do
        click_link "Sign in with Facebook"
        expect(page).to have_prefilled_fields(user_attributes)

        fill_profile_with(user_attributes)
        expect(page).to have_text(success_message)
        expect(page).to have_text(registered_user.email)
      end
    end
  end

  context "when user is persisted" do
    let(:verified) { true }
    let(:success_message) { "Successfully authenticated from #{provider_name} account." }

    before { create(:user, user_attributes) }

    context "when provider is Google" do
      let(:provider) { :google_oauth2 }

      scenario "Visitor signs in through provider" do
        click_link "Sign in with Google"

        expect(page).to have_text(success_message)
        expect(page).to have_text(registered_user.email)
      end
    end

    context "when provider is Facebook" do
      let(:provider) { :facebook }

      scenario "Visitor signs in through provider" do
        click_link "Sign in with Facebook"

        expect(page).to have_text(success_message)
        expect(page).to have_text(registered_user.email)
      end
    end
  end

  context "when oauth can't be used for authentication" do
    let(:verified) { false }
    let(:error_msg) { "Your #{provider_name} account can't be used to sign in. Please verify it via profile page." }

    context "when provider is Google" do
      let(:provider) { :google_oauth2 }

      scenario "Visitor not able to sign up through provider" do
        click_link "Sign in with Google"

        expect(page).to have_text(error_msg)
        expect(page).not_to have_text(user_attributes[:email])
      end
    end

    context "when provider is Facebook" do
      let(:provider) { :facebook }

      scenario "Visitor not able to sign up through provider" do
        click_link "Sign in with Facebook"

        expect(page).to have_text(error_msg)
        expect(page).not_to have_text(user_attributes[:email])
      end
    end
  end

  # rubocop:disable Style/PredicateName
  def have_prefilled_fields(opts = {})
    have_field("user_full_name", with: opts[:full_name])
    have_field("user_email", with: opts[:email])
  end
  # rubocop:enable Style/PredicateName

  def fill_profile_with(opts = {})
    fill_in "user_password", with: opts[:password]
    fill_in "user_password_confirmation", with: opts[:password_confirmation]
    click_button "Sign up"
  end
end

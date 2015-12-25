require "rails_helper"

feature "Connect social account" do
  let(:social_profiles_section) { ".js-social-profiles" }

  context "oauth confirmed" do
    include_context :stub_omniauth

    before do
      login_as(user, scope: :user)
      visit edit_user_registration_path(user)
      click_link "Facebook"
    end

    context "user confirmed" do
      let!(:user) { create(:user, :confirmed, :from_auth_hashie) }

      scenario "User connects social account" do
        within social_profiles_section do
          expect(page).to have_content("Facebook")
        end
      end
    end

    context "user not confirmed" do
      let!(:user) { create(:user, :from_auth_hashie) }

      scenario "User connects social account" do
        within social_profiles_section do
          expect(page).to have_content("Facebook")
        end

        open_email(user.email)

        expect(current_email).to have_subject("Confirmation instructions")
        expect(current_email).to have_body_text(user.full_name)
      end
    end
  end

  context "oauth not confirmed" do
    include_context :stub_not_verified_omniauth

    before do
      login_as(user, scope: :user)
      visit edit_user_registration_path(user)
      click_link "Facebook"
    end

    context "user confirmed" do
      let!(:user) { create(:user, :confirmed, :from_auth_hashie) }

      scenario "User connects social account" do
        within social_profiles_section do
          expect(page).to have_content("Facebook")
        end
      end
    end

    context "user not confirmed" do
      let!(:user) { create(:user, :from_auth_hashie) }

      scenario "User sees alert" do
        expect(page).not_to have_css(social_profiles_section)
        expect(page).to have_text("Please confirm your account before connecting your facebook account.")
        expect(current_path).to eq(edit_user_registration_path)
      end
    end
  end
end

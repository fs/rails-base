require "rails_helper"

feature "Connect social account" do
  before do
    login_as(user, scope: :user)
    visit edit_user_registration_path(user)
    click_link "Facebook"
  end

  context "oauth confirmed" do
    include_context :stub_omniauth

    context "user confirmed" do
      let!(:user) { create(:user, :confirmed, :from_auth_hashie) }

      scenario "User connects social account" do
        within ".js-social-profiles" do
          expect(page).to have_content("Facebook")
        end
      end
    end

    context "user not confirmed" do
      let!(:user) { create(:user, :from_auth_hashie) }

      scenario "User connects social account" do
        within ".js-social-profiles" do
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

    context "user confirmed" do
      let!(:user) { create(:user, :confirmed, :from_auth_hashie) }

      scenario "User connects social account", :js do
        save_and_open_screenshot

        # within ".js-social-profiles" do
        #   expect(page).to have_content("Facebook")
        # end
      end
    end

    context "user not confirmed" do
    end
  end
end

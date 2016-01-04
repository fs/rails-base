require "rails_helper"

feature "Connect social account" do
  context "oauth confirmed" do
    include_context :stub_omniauth

    before { click_connect_fb }

    context "user confirmed" do
      let!(:user) { create(:user, :confirmed, :from_auth_hashie) }

      scenario "User connects social account" do
        expect(page).to have_connected_account("Facebook")
      end
    end

    context "user not confirmed" do
      let!(:user) { create(:user, :from_auth_hashie) }

      scenario "User have to confirm own account" do
        expect(page).to have_connected_account("Facebook")

        open_email(user.email)

        expect(current_email).to have_subject("Confirmation instructions")
        expect(current_email).to have_body_text(user.full_name)
      end
    end
  end

  context "oauth not confirmed" do
    include_context :stub_not_verified_omniauth

    before { click_connect_fb }

    context "user confirmed" do
      let!(:user) { create(:user, :confirmed, :from_auth_hashie) }

      scenario "User connects social account" do
        expect(page).to have_connected_account("Facebook")
      end
    end

    context "user not confirmed" do
      let!(:user) { create(:user, :from_auth_hashie) }

      scenario "User sees alert" do
        expect(page).to have_text("Please confirm your account before connecting your facebook account.")
        expect(current_path).to eq(root_path)
      end
    end
  end

  def click_connect_fb
    login_as(user, scope: :user)
    visit edit_user_registration_path(user)
    click_link "Facebook"
  end
end

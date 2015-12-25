require "rails_helper"

feature "Sign in with social account" do
  context "when oauth confirmed" do
    include_context :stub_omniauth

    context "when user found by uid" do
      let!(:social_profile) { create(:social_profile, user: user) }

      before do
        visit new_user_session_path
        click_link "Sign in with Facebook"
      end

      context "when user confirmed" do
        let!(:user) { create(:user, :confirmed, :from_auth_hashie) }

        scenario "User signs up" do
          expect(page).to have_text(user.full_name)
          expect(current_path).to eq(root_path)
        end
      end

      context "when user not confirmed" do
        let!(:user) { create(:user, :from_auth_hashie) }

        scenario "Users signs up through Finish page" do
          expect(page).to have_text("Finish Signup")
          # TODO: finish signup
        end
      end
    end

    context "when user found by email" do
      context "when user confirmed" do
        let!(:user) { create(:user, :confirmed, :from_auth_hashie) }

        before do
          visit new_user_session_path
          click_link "Sign in with Facebook"
        end

        scenario "Users connects social profile" do
          expect(page).to have_text(user.full_name)
          expect(current_path).to eq(root_path)
        end
      end

      context "when user not confirmed" do
        let!(:user) { create(:user, :from_auth_hashie) }

        before do
          visit new_user_session_path
          click_link "Sign in with Facebook"
        end

        scenario "Users connects social profile" do
          expect(page).to have_text("Finish Signup")
        end
      end
    end

    context "when user not found" do
      before do
        visit new_user_session_path
        click_link "Sign in with Facebook"
      end

      scenario "Users connects social profile" do
        expect(page).to have_text("Finish Signup")
      end
    end
  end

  context "when oauth not confirmed" do
    include_context :stub_not_verified_omniauth

    context "when user found by uid" do
      let!(:social_profile) { create(:social_profile, user: user) }
      let!(:user) { create(:user, :confirmed) }

      before do
        visit new_user_session_path
        click_link "Sign in with Facebook"
      end

      scenario "Users connects social profile" do
        expect(page).to have_text("Finish Signup")
      end
    end

    context "when user found by email" do
      let!(:user) { create(:user, :confirmed, :from_auth_hashie) }

      before do
        visit new_user_session_path
        click_link "Sign in with Facebook"
      end

      scenario "Users connects social profile" do
        expect(page).to have_text("Please, connect your account from profile page.")
      end
    end

    context "when user not found" do
      before do
        visit new_user_session_path
        click_link "Sign in with Facebook"
      end

      scenario "Users connects social profile" do
        expect(page).to have_text("Finish Signup")
      end
    end
  end
end

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

        include_examples "finishing_sign_up" do
          let(:name) { user.full_name }
          let(:email) { "mailer@mail.com" }
          let(:password) { "123456qwe" }
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

        include_examples "finishing_sign_up" do
          let(:name) { user.full_name }
          let(:email) { "mailer@mail.com" }
          let(:password) { "123456qwe" }
        end
      end
    end

    context "when user not found" do
      include_examples "finishing_sign_up" do
        let(:name) { "Joe Bloggs" }
        let(:email) { "mailer@mail.com" }
        let(:password) { "123456qwe" }
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

      scenario "User signs in" do
        expect(page).to have_text(user.full_name)
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
        expect(current_path).to eq(root_path)
      end
    end

    context "when user not found" do
      include_examples "finishing_sign_up" do
        let(:name) { "Joe Bloggs" }
        let(:email) { "mailer@mail.com" }
        let(:password) { "123456qwe" }
      end
    end
  end
end

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

        scenario "Users should finish registration" do
          expect(page).to have_text("Finish Signup")

          fill_in :user_email, with: "mailer@mail.com"
          fill_in :user_password, with: "123456qwe"
          click_button "Finish Signup"

          open_email("mailer@mail.com")
          expect(current_email).to have_subject("Confirmation instructions")
          expect(current_email).to have_body_text(user.full_name)

          visit_in_email("Confirm my account")
          expect(page).to have_content("Your email address has been successfully confirmed")
          expect(page).to have_text(user.full_name)
          expect(page).to have_text("mailer@mail.com")
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

        scenario "Users should finish registration" do
          expect(page).to have_text("Finish Signup")

          fill_in :user_email, with: "mailer@mail.com"
          fill_in :user_password, with: "123456qwe"
          click_button "Finish Signup"

          open_email("mailer@mail.com")
          expect(current_email).to have_subject("Confirmation instructions")
          expect(current_email).to have_body_text(user.full_name)

          visit_in_email("Confirm my account")
          expect(page).to have_content("Your email address has been successfully confirmed")
          expect(page).to have_text(user.full_name)
          expect(page).to have_text("mailer@mail.com")
        end
      end
    end

    context "when user not found" do
      let(:name_from_auth_hash) { "Joe Bloggs" }

      before do
        visit new_user_session_path
        click_link "Sign in with Facebook"
      end

      scenario "Users should finish registration" do
        expect(page).to have_text("Finish Signup")

        fill_in :user_email, with: "mailer@mail.com"
        fill_in :user_password, with: "123456qwe"
        click_button "Finish Signup"

        open_email("mailer@mail.com")
        expect(current_email).to have_subject("Confirmation instructions")
        expect(current_email).to have_body_text(name_from_auth_hash)

        visit_in_email("Confirm my account")
        expect(page).to have_content("Your email address has been successfully confirmed")
        expect(page).to have_text(name_from_auth_hash)
        expect(page).to have_text("mailer@mail.com")
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
      let(:name_from_auth_hash) { "Joe Bloggs" }

      before do
        visit new_user_session_path
        click_link "Sign in with Facebook"
      end

      scenario "Users connects social profile" do
        expect(page).to have_text("Finish Signup")

        fill_in :user_email, with: "mailer@mail.com"
        fill_in :user_password, with: "123456qwe"
        click_button "Finish Signup"

        open_email("mailer@mail.com")
        expect(current_email).to have_subject("Confirmation instructions")
        expect(current_email).to have_body_text(name_from_auth_hash)

        visit_in_email("Confirm my account")
        expect(page).to have_content("Your email address has been successfully confirmed")
        expect(page).to have_text(name_from_auth_hash)
        expect(page).to have_text("mailer@mail.com")
      end
    end
  end
end

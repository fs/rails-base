require "rails_helper"

feature "Sign In" do
  let(:user) { create :user }
  let(:unconfirmed_user) { create :user, :not_confirmed }

  def sign_in(email, password)
    visit new_user_session_path

    fill_form(:user, email: email, password: password)
    click_button "Sign in"
  end

  scenario "Visitor signs in with valid credentials" do
    sign_in(user.email, user.password)

    expect(page).to have_content("Sign out")
  end

  scenario "Visitor signs in with invalid credentials" do
    sign_in(user.email, "wrong password")

    expect(page).to have_content("Sign in")
    expect(page).to have_content(I18n.t("devise.failure.invalid", authentication_keys: "email"))
  end

  scenario "Visitor signs in with unconfirmed email address" do
    sign_in(unconfirmed_user.email, user.password)

    expect(page).to have_content(I18n.t("devise.failure.unconfirmed"))
  end
end

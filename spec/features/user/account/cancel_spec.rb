require "rails_helper"

feature "Cancel Account" do
  include_context "current user signed in"

  background do
    visit edit_user_registration_path(current_user)
  end

  scenario "User cancels account" do
    click_link "Cancel my account"

    expect(page).to have_content("Sign in")
    expect(page).to have_content(I18n.t("devise.registrations.destroyed"))

    click_link "Sign in"
    fill_form(:user, current_user.attributes.slice(:email, :password))
    click_button "Sign in"

    expect(page).to have_content(I18n.t("devise.failure.invalid", authentication_keys: "email"))
  end
end

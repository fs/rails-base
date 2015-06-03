require "rails_helper"

feature "Sign In" do
  let(:user) { create :user, :confirmed }

  scenario "Visitor resets his password" do
    visit new_user_password_path

    fill_in "Enter your email address", with: user.email
    click_button "Send me reset password instructions"

    open_email(user.email)

    expect(current_email).to have_subject "Reset password instructions"
    expect(current_email).to have_body_text(user.full_name)
  end
end

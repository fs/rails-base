require "rails_helper"

feature "Password Reset" do
  let(:new_password) { "qwe123" }
  let(:user) { create :user }

  def update_password
    fill_in "Enter new password", with: new_password
    fill_in "Confirm your new password", with: new_password
    click_button "Update password"
  end

  scenario "Visitor resets his password" do
    visit new_user_password_path

    fill_in "Enter your email address", with: user.email
    click_button "Send me reset password instructions"

    open_email(user.email)

    expect(current_email).to have_subject(I18n.t("devise.mailer.reset_password_instructions.subject"))
    expect(current_email).to have_body_text(user.full_name)

    visit_in_email("Change my password")
    update_password

    expect(page).to have_content(I18n.t("devise.passwords.updated_not_active"))
  end
end

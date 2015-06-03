require "rails_helper"

feature "Sign Up" do
  let(:user_attributes) { attributes_for(:user).slice(:full_name, :email, :password, :password_confirmation) }
  let(:user) { User.find_by_email(user_attributes[:email]) }

  before(:each) do
    visit new_user_registration_path

    fill_form(:user, user_attributes)

    click_button "Sign up"
  end

  scenario "Visitor signs up" do
    open_email(user.email)

    expect(current_email).to have_subject "Confirmation instructions"
    expect(current_email).to have_body_text(user.full_name)
  end

  scenario "Visitor confirms account" do
    open_email(user.email)
    visit_in_email "Confirm my account"

    expect(page).to have_content("Your email address has been successfully confirmed")
    expect(page).to have_text(user.email)
  end
end

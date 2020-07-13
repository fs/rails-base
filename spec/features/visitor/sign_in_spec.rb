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

    expect(page).to have_content(user.full_name)
  end

  scenario "Visitor signs in with invalid credentials" do
    sign_in(user.email, "wrong password")

    expect(page).to have_content("Sign in")
    expect(page).to have_content("Invalid Email or password")
  end

  scenario "Visitor signs in with unconfirmed email address" do
    sign_in(unconfirmed_user.email, user.password)

    expect(page).to have_content("You have to confirm your email address before continuing.")
  end

  scenario "Visitor signs in with invalid credentials many times" do
    Devise.maximum_attempts.times do
      sign_in(user.email, "wrong password")
    end

    expect(page).to have_content("Your account is locked.")
  end
end

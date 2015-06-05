require "rails_helper"

feature "Sign In" do
  let(:user) { create :user, :confirmed }
  let(:unconfirmed_user) { create :user, :not_confirmed }

  scenario "Visitor signs in with valid credentials" do
    sign_in(user.email, user.password)

    expect(page).to have_content("Sign out")
  end

  scenario "Visitor signs in with invalid credentials" do
    sign_in(user.email, "wrong password")

    expect(page).to have_content("Sign in")
    expect(page).to have_content("Invalid email or password")
  end

  scenario "Visitor signs in with unconfirmed email address" do
    sign_in(unconfirmed_user.email, user.password)

    expect(page).to have_content("You have to confirm your email address before continuing.")
  end
end

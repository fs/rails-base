require "rails_helper"

feature "Sign Out" do
  let(:user) { create :user, :confirmed }

  background do
    sign_in(user.email, "123456")
  end

  scenario "User signs out" do
    click_link "Sign out"

    expect(page).to have_content("Sign in")
  end
end

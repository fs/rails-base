require "rails_helper"

feature "Sign Out" do
  let(:user) { create :user, :confirmed }

  background do
    login_as user
  end

  scenario "User signs out" do
    visit "/"
    click_link "Sign out"

    expect(page).to have_content("Sign in")
  end
end

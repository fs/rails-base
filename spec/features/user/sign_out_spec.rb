require "rails_helper"

feature "Sign Out" do
  include_context "current user signed in"

  scenario "User signs out" do
    visit "/"
    click_link "Sign out"

    expect(page).to have_content("Sign in")
  end
end

require "rails_helper"

feature "Sign Out" do
  include_context "when current user signed in"

  scenario "User signs out" do
    visit "/"

    find("a", text: current_user.full_name).click
    click_link "Sign out"

    expect(page).to have_content("Sign in")
  end
end

require "rails_helper"

feature "Update Account" do
  include_context "current user signed in"

  background do
    visit edit_user_registration_path(current_user)
  end

  scenario "User updates account with valid data" do
    fill_form(:user, full_name: "New Name")
    click_on "Update"

    expect(page).to have_content("New Name")
  end
end

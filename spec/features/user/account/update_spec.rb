require "rails_helper"

feature "Update Account" do
  let(:user) { create :user, :confirmed }

  background do
    login_as user
    visit edit_user_registration_path(user)
  end

  scenario "User updates account with valid data" do
    fill_form(:user, full_name: "New Name", current_password: user.password)
    click_on "Update"

    expect(page).to have_content("New Name")
  end

  scenario "User updates account with invalid password" do
    fill_form(:user, full_name: "New Name", current_password: "wrong")
    click_on "Update"

    expect(page).to have_content("is invalid")
  end
end

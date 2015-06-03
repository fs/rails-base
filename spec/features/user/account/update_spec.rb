require "rails_helper"

feature "Update Account" do
  let(:user_password) { "123456" }
  let(:user) { create :user, :confirmed }

  before do
    sign_in(user.email, user_password)
    visit edit_user_registration_path(user)
  end

  scenario "User updates account with valid data" do
    fill_form(:user, full_name: "New Name", current_password: user_password)
    click_on "Update"

    expect(page).to have_content("New Name")
  end

  scenario "User updates account with invalid password" do
    fill_form(:user, full_name: "New Name", current_password: "wrong")
    click_on "Update"

    expect(page).to have_content("is invalid")
  end
end

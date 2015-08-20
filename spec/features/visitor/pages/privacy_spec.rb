require "rails_helper"

feature "Privacy Page" do
  scenario "Visitor views Privacy Page" do
    visit privacy_url
    expect(page).to have_content("Privacy Policy")
  end
end

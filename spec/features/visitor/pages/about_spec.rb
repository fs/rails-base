require "rails_helper"

feature "About Page" do
  scenario "Visitor views About Page" do
    visit about_url
    expect(page).to have_content("About")
  end
end

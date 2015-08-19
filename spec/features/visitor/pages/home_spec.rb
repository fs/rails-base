require "rails_helper"

feature "Home Page" do
  scenario "Visitor views Home Page" do
    visit root_url
    expect(page).to have_content("Home")
  end
end

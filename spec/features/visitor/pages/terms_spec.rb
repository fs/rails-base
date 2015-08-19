require "rails_helper"

feature "Terms Page" do
  scenario "Visitor views Terms Page" do
    visit terms_url
    expect(page).to have_content("Terms")
  end
end

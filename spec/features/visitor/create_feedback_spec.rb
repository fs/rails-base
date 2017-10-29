require "rails_helper"

feature "Create feedback" do
  scenario "Visitor resets his password" do
    visit new_feedback_path

    fill_form :feedback, attributes_for(:feedback)
    click_button "Submit feedback"

    expect(page).to have_content("Feedback was successfully send!")
  end
end

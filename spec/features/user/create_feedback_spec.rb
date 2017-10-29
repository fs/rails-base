require "rails_helper"

feature "Create feedback" do
  include_context "current user signed in"

  # let(:current_user) { create :user, full_name: "" }

  scenario "User creates feedback" do
    visit new_feedback_path

    expect(find_field("Name").value).to eq current_user.full_name
    expect(find_field("Email").value).to eq current_user.email

    fill_form :feedback, attributes_for(:feedback).slice(:text)
    click_button "Submit feedback"

    expect(page).to have_content("Feedback was successfully send!")
  end
end

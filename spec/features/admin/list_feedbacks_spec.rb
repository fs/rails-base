require "rails_helper"

feature "List feedback" do
  include_context "current admin signed in"

  background do
    create :feedback, email: "test@test.com", name: "John", text: "Hello world!"
    create :feedback, email: "test2@test.com", name: "Peter", text: "It's a great website"
  end

  scenario "User creates feedback" do
    visit feedbacks_path

    find(:xpath, //)
    expect(page).to have_content("Hello world!")
    expect(page).to have_content("It's a great website")

    expect(page).to have_content("Feedback was successfully send!")
  end
end

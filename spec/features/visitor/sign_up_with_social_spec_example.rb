require "rails_helper"

feature "Sign Up with social account" do
  include_context :stub_omniauth

  let(:name_from_auth_hash) { "Joe Bloggs" }

  scenario "Visitor signs up" do
    visit new_user_session_path

    click_link "Sign in with Facebook"

    expect(page).to have_content("Finish Signup")

    fill_in :user_email, with: "mailer@mail.com"
    fill_in :user_password, with: "123456qwe"
    click_button "Finish Signup"

    open_email("mailer@mail.com")

    expect(current_email).to have_subject("Confirmation instructions")
    expect(current_email).to have_body_text(name_from_auth_hash)

    visit_in_email("Confirm my account")

    expect(page).to have_content("Your email address has been successfully confirmed")
    expect(page).to have_text(name_from_auth_hash)
    expect(page).to have_text("mailer@mail.com")
  end
end

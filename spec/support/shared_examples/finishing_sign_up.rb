shared_examples_for "finishing sign up" do
  before do
    visit new_user_session_path
    click_link "Sign in with Facebook"
  end

  scenario "User finishing registration" do
    expect(page).to have_text("Finish Signup")

    fill_in :user_email, with: email
    fill_in :user_password, with: password
    click_button "Finish Signup"

    open_email(email)
    expect(current_email).to have_subject("Confirmation instructions")
    expect(current_email).to have_body_text(name)

    visit_in_email("Confirm my account")
    expect(page).to have_content("Your email address has been successfully confirmed")
    expect(page).to have_text(name)
    expect(page).to have_text(email)
  end
end

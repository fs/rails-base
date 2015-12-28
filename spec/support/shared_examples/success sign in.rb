shared_examples_for "success sign in" do
  scenario "User signs in" do
    expect(page).to have_text(user.full_name)
    expect(current_path).to eq(root_path)
  end
end

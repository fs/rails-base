step 'I exist as a user' do
  @current_user = create :user, :confirmed
end

step 'I am signed in' do
  @current_user = create :user, :confirmed
  sign_in_with @current_user.email, '123456'
end

step 'I should be signed in' do
  within '.top-bar' do
    expect(page).to have_content 'Sign out'
  end
end

step 'I should be signed out' do
  within '.top-bar' do
    expect(page).to_not have_content 'Sign out'
  end
end

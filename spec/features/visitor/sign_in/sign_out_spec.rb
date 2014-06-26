require 'spec_helper'

feature 'Sign out' do
  let(:user) { create :user, :confirmed }
  let(:login_page) { LoginPage.new }
  let(:index_page) { IndexPage.new }

  before do
    login_page.visit_page.sign_in(user.email, '123456')
  end

  scenario 'Logged in user signs out' do
    index_page.visit_page.sign_out

    within '.top-bar' do
      expect(page).to have_content 'Sign in'
    end
  end
end

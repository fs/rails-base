require 'rails_helper'

feature 'Sign out' do
  let(:user) { create :user, :confirmed }

  let(:login_page) { Devise::Sessions::New.new }
  let(:index_page) { Dashboard::Index.new }

  before(:each) do
    login_page.load
    login_page.sign_in(user.email, '123456')
  end

  scenario 'Logged in user signs out' do
    index_page.load
    index_page.top_bar.sign_out_link.click

    expect(index_page.top_bar).to have_sign_in_link
  end
end

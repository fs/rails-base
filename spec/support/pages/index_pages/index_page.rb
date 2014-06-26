class IndexPage
  include Capybara::DSL

  def visit_page
    visit '/'
    self
  end

  def sign_out
    click_link 'Sign out'
  end
end

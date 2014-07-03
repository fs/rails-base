class PageObjects

  include Rails.application.routes.url_helpers
  include EmailSpec::Helpers
  include EmailSpec::Matchers
  include Capybara::DSL

  def has_sign_out_link?
    top_bar.has_content? 'Sign out'
  end

  def has_sign_in_link?
    top_bar.has_content? 'Sign in'
  end

  def has_confirm_account_text?
    has_content? 'You have to confirm your account before continuing'
  end

  private

  def top_bar
    find('.top-bar')
  end
end

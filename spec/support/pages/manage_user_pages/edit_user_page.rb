class EditUserPage
  include Capybara::DSL

  def visit_page
    visit 'users/edit'
    self
  end

  def cancel_account
    click_link 'Cancel my account'
  end

  def update_account_form(fields)
    fields.each do |key, value|
      fill_in("user_#{key}", with: value)
    end

    click_button 'Update'
  end
end

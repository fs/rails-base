class EditUserPage < SitePrism::Page
  set_url 'users/edit'

  section :top_bar, TopBar, '.top-bar'

  element :cancel_account_link, 'a', text: 'Cancel my account'

  def update_account_form(fields)
    fields.each do |key, value|
      fill_in("user_#{key}", with: value)
    end

    click_button 'Update'
  end
end

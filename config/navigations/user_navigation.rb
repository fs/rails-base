SimpleNavigation::Configuration.run do |navigation|
  navigation.autogenerate_item_ids = false
  navigation.selected_class = nil
  navigation.active_leaf_class = 'active'

  navigation.items do |user|
    user.dom_class = 'user'

    if user_signed_in?
      user.item :account, current_user.full_name_with_email, edit_user_registration_path
      user.item :sign_out, 'Sign out', destroy_user_session_path
    else
      user.item :sign_in, 'Sign in', new_user_session_path
      user.item :sign_up, 'Sign up', new_user_registration_path
    end
  end
end

SimpleNavigation::Configuration.run do |navigation|
  navigation.autogenerate_item_ids = false

  navigation.items do |user|
    user.dom_class = 'pull-right nav '

    if user_signed_in?
      user.item :account, current_user.full_name, '#', 
                :class => 'dropdown',
                :link => {:class => 'dropdown-toggle', 'data-toggle' => 'dropdown'} do |account|
                  
        account.dom_class = 'dropdown-menu'
        
        account.item :edit_account, 'Edit profile', edit_user_registration_path
        account.item :sign_out, 'Sign out', destroy_user_session_path
      end
    else
      user.item :sign_in, 'Sign in', new_user_session_path
      user.item :sign_up, 'Sign up', new_user_registration_path
    end
  end
end

SimpleNavigation::Configuration.run do |navigation|  
  navigation.autogenerate_item_ids = false
  
  navigation.items do |user|
    user.dom_class = 'user'

    user.with_options(:if => Proc.new { user_signed_in? }) do |signed_in_user|
      signed_in_user.item :account, 'My Account', edit_user_registration_path
      signed_in_user.item :sign_out, 'Sign out', destroy_user_session_path
    end

    user.with_options(:unless => Proc.new { user_signed_in? }) do |signed_out_user|
      signed_out_user.item :sign_in, 'Sign in', new_user_session_path
      signed_out_user.item :sign_up, 'Sign up', new_user_registration_path
    end
  end
end
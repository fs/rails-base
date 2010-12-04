module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /the home\s?page/
      '/'
    when /the sign up page/
      new_user_registration_path
    when /the sign in page/
      new_user_session_path
    when /the sign out page/
      destroy_user_session_path
    when /the send password instructions page/
      new_user_password_path
    when /the resend confirmation instructions page/
      new_user_confirmation_path
    when /the edit account page/
      edit_user_registration_path
    when /^the (.*) page with id: (\d+)$/i
      begin
        id, path_components = $2.to_i, $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym, :id => id)
      rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    else
      begin
        page_name =~ /the (.*) page/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)

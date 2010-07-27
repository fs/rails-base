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
    when /^the edit unit page with id: (\d+)$/i
      edit_unit_path(:id => $1)
    when /^the edit room page with id: (\d+)$/i
      edit_room_path(:id => $1)
    when /^the room page with id: (\d+)$/i
      room_path(:id => $1)
    when /^the user page with id: (\d+)$/i
      user_path(:id => $1)
    when /^the user units page with id: (\d+)$/i
      user_units_path(:user_id => $1)

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

class <%= controller_class_name %>Controller < ApplicationController
  inherit_resources
<% if options[:singleton] -%>
  defaults :singleton => true
<% end -%>
end

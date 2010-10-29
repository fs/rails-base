class <%= controller_class_name %>Controller < ApplicationController
  inherit_resources
<% if options[:singleton] -%>
  defaults :singleton => true
<% end -%>

  protected

  def collection
    @<%= plural_table_name %> ||= end_of_association_chain.paginate(:page => params[:page])
  end
end

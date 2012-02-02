<% module_namespacing do -%>
class <%= controller_class_name %>Controller < ApplicationController
  respond_to :html

  expose(:<%= singular_table_name %>)
  expose(:<%= plural_table_name %>) { <%= class_name %>.scoped }

  def create
    flash[:notice] = '<%= human_name %> was successfully created.' if <%= singular_table_name %>.save
    respond_with(<%= singular_table_name %>)
  end

  def update
    flash[:notice] = '<%= human_name %> was successfully updated.' if <%= singular_table_name %>.save
    respond_with(<%= singular_table_name %>)
  end

  def destroy
    <%= singular_table_name %>.destroy
    respond_with(<%= singular_table_name %>)
  end
end
<% end -%>

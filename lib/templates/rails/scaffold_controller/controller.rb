<% module_namespacing do -%>
class <%= controller_class_name %>Controller < ApplicationController
  respond_to :html

  expose :<%= singular_table_name %>
  expose :<%= plural_table_name %>, -> { <%= class_name %>.page(params[:page]) }

  def create
    flash[:notice] = '<%= human_name %> was successfully created.' if <%= singular_table_name %>.save
    respond_with(<%= singular_table_name %>)
  end

  def update
    if <%= singular_table_name %>.update_attributes(<%= singular_table_name %>_params)
      flash[:notice] = '<%= human_name %> was successfully updated.'
    end

    respond_with(<%= singular_table_name %>)
  end

  def destroy
    <%= singular_table_name %>.destroy
    respond_with(<%= singular_table_name %>)
  end

  private

  def <%= singular_table_name %>_params
    params.require(:<%= singular_table_name %>).permit(<%= attributes.map {|a| ":#{a.name}"}.join(', ') %>)
  end
end
<% end -%>

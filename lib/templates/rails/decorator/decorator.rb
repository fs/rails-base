<%- module_namespacing do -%>
  <%- if parent_class_name.present? -%>
class <%= class_name %>Decorator < <%= parent_class_name %>
  <%- else -%>
class <%= class_name %>
  <%- end -%>
end
<% end -%>

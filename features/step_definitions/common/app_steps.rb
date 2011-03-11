When /^I send "(GET|POST|PUT|DELETE)" request to the (.+) page(?: with #{capture_fields}(?: namespaced with "([^"]*)")?)?$/ do |method, page_name, fields, namespace|
  params = parse_fields(fields) || {}
  params = {namespace => params} if namespace.present?

  Capybara.current_session.driver.process(method.downcase.to_sym, path_to("the #{page_name} page"), params)
end

Then /^I should see "([^"]*)" error for "([^"]*)"$/ do |error_message, id|
  Then %Q{I should see "#{error_message}" within "li##{id}_input p.inline-errors"}
end

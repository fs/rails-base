When /^I send "(GET|POST|PUT|DELETE)" request to (.+)$/ do |method, page_name|
  Capybara.current_session.driver.process(method.downcase.to_sym, path_to(page_name))
end

Then /^I should see "([^"]*)" error for "([^"]*)"$/ do |error_message, id|
  Then %Q{I should see "#{error_message}" within "li##{id}_input p.inline-errors"}
end

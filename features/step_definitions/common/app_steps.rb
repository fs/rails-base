Then /^I should see "([^"]*)" error for "([^"]*)"$/ do |error_message, id|
  with_scope %Q{".input:has(##{id}) span.error"} do
    step %Q{I should see "#{error_message}"}
  end
end

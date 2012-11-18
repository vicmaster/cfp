When /^I follow "(.*?)"$/ do |link_text|
  click_link link_text
end

When /^I fill in the following:$/ do |table|
  table.rows_hash.each do |field, value|
    fill_in field, :with => value
  end
end

Then /^show me the page$/ do
  save_and_open_page
end

Then /^I should be on the "(.*?)" page$/ do |page|
  current_path.should == send("#{page}_path")
end

Then /^I should see "(.*?)"$/ do |expectation|
  page.should have_content expectation
end

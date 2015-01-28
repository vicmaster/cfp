When /^I follow "([^\".]*?)"$/ do |link_text|
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
  expect(current_path).to eq send("#{page}_path")
end

Then /^I should see "(.*?)"$/ do |expectation|
  expect(page).to have_content("#{expectation}")
end

When /^I (go to|am on) the "(.*?)" page$/ do |action, page|
  visit send("#{page}_path")
end

When /^I follow "(.*?)" for "(.*?)"$/ do |link_text, row_text|
  within("tr", :text => "#{row_text}") do |ref|
    click_link link_text
  end
end

Then /^I should not see "(.*?)"$/ do |expectation|
  expect(page).not_to have_content expectation
end

When /^I press the "(.*?)" button$/ do |button|
  click_button button
end

When /^I choose "(.*?)" from "(.*?)"$/ do |value, field|
  select value, :from => field
end

Then /^I should see the following:$/ do |table|
  table.raw.each do |row|
    expect(page).to have_content row.first
  end
end

Then /^I should see a "(.*?)" tag enclosing "(.*?)"$/ do |tag, contains|
  expect(page).to have_selector("#{tag}:contains('#{contains}')")
end

Given /^I should see (\d+)?$/ do |n|
  expect(find('#proposal_1').find('td', :text => n.to_i))
end

Then /^I should be on the new profile page$/ do
  expect(current_path).to eq new_profile_path
end

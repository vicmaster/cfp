Then /^I should be on the new profile page$/ do
  current_path.should == new_profile_path
end

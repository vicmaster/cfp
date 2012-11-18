Given /^I am on the proposals page$/ do
  visit cfp.proposals_path
end

Then /^I press the Create button$/ do
  click_button 'Create Proposal'
end

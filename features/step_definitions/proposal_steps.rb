Then /^I press the Create button$/ do
  click_button 'Create Proposal'
end

Given /^a proposal titled "(.*?)"$/ do |proposal_title|
  @proposal             = Cfp::Proposal.new
  @proposal.user        = @user
  @proposal.title       = proposal_title
  @proposal.abstract    = Faker::Lorem.paragraphs(3).first
  @proposal.description = Faker::Lorem.paragraphs(3).first

  @proposal.save!
end

Given /^that proposal has the following abstract:$/ do |string|
  @proposal.abstract = string
  @proposal.save!
end

When /^I press the Update button$/ do
  click_button 'Update Proposal'
end

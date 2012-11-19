Then /^I should be on the coments page for the proposal$/ do
  current_path.should eq proposal_comments_path(@proposal)
end

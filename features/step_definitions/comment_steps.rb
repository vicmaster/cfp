Then /^I should be on the coments page for the proposal$/ do
  expect(current_path).to eq proposal_comments_path(@proposal)
end

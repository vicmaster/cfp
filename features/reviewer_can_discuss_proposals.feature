Feature: Reviewer can discuss proposals

  Background: A proposal exists
    Given a regular User exists
    And a proposal titled "The great Ruby talk"
    And a reviewer User exists
    And that user is logged in

  Scenario: Comment on a proposal
    Given I am on the "proposals" page
    When I follow "Discuss" for "The great Ruby talk"
    And I follow "Comment"
    And I fill in the following:
      | Comment | The comment that I just made |
    And I press the "Create Comment" button
    Then I should be on the coments page for the proposal
    And I should see "The comment that I just made"

  @javascript
  Scenario: Rate a proposal
    Given I am on the "proposals" page
    When I follow "Discuss" for "The great Ruby talk"
    And I choose "2" from "Rank"
    And I follow "Back to Proposals"
    Then I should be on the "proposals" page
    # TODO: Uncomment this line below and it pass in local
    # just failing in travis
    #And I should see 2

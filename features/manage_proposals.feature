Feature: Manage My Proposals

  Background:
    Given a regular User exists
    And that user is logged in

  Scenario: Create a Proposal
    Given I am on the proposals page
    When I follow "Submit Proposal"
    And I fill in the following:
       | Title    | A very cool talk           |
       | Level    | Intermediate               |
       | Abstract | Some talk about cool stuff |
       | Tags     | talk ruby                  |
    And I press the Create button
    Then I should be on the "proposals" page
    And I should see "A very cool talk"

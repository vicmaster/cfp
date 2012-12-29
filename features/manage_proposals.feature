Feature: Manage My Proposals

  Background:
    Given a regular User exists
    And CFP is open
    And that user is logged in

  Scenario: Create a Proposal
    Given I am on the "proposals" page
    When I follow "Submit Proposal"
    And I fill in the following:
       | Title    | A very cool talk           |
       | Abstract | Some talk about cool stuff |
       | Tags     | talk ruby                  |
    And I choose "Intermediate" from "Level"
    And I press the Create button
    Then I should be on the "proposals" page
    And I should see "A very cool talk"

  Scenario: Edit a proposal
    Given a proposal titled "The great Ruby talk"
    When I go to the "proposals" page
    And I follow "Edit" for "The great Ruby talk"
    And I fill in the following:
       | Title    | A very cool talk           |
       | Abstract | Some talk about cool stuff |
       | Tags     | talk ruby                  |
    And I choose "Intermediate" from "Level"
    And I press the Update button
    Then I should be on the "proposals" page
    And I should see "A very cool talk"

  Scenario: Delete a proposal
    Given a proposal titled "The great Ruby talk"
    When I go to the "proposals" page
    And I follow "Delete" for "The great Ruby talk"
    Then I should not see "The great Ruby talk"

  Scenario: Edit a proposal
    Given a proposal titled "The great Ruby talk"
    And that proposal has the following abstract:
      """
      # A header
      ## A header 2

      Lorem Ipsum dolor sit amet
      """
    When I go to the "proposals" page
    And I follow "Show" for "The great Ruby talk"
    Then I should see a "h1" tag enclosing "A header"
    And I should see a "h2" tag enclosing "A header 2"
    And I should see "Lorem Ipsum dolor sit amet"

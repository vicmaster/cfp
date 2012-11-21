Feature: User profiles

  Background:
    Given a regular User with no profile exists
    And that user is logged in

  Scenario: When the user has no profile redirct to the new profile page
    When I go to the "proposals" page
    Then I should be on the new profile page

Feature: User profiles

  Background:
    Given a regular User with no profile exists
    And that user is logged in

  Scenario: When the user has no profile redirct to the new profile page
    When I go to the "proposals" page
    Then I should be on the new profile page
    When I fill in the following:
       | Name    | John Mellencamp        |
       | Company | Crowd Interactive      |
       | Title   | CEO                    |
       | Bio     | The greatest man alive |
    And I choose "en" from "Locale"
    And I press the "Create Profile" button
    Then I should be on the "profile" page
    And I should see the following:
       | John Mellencamp        |
       | Crowd Interactive      |
       | CEO                    |
       | The greatest man alive |

  Scenario: Edit a proposal
    Given the user has a profile
    When I go to the "profile" page
    And I follow "Edit"
    And I fill in the following:
       | Name    | John Mellencamp        |
       | Company | Crowd Interactive      |
       | Title   | CEO                    |
       | Bio     | The greatest man alive |
    And I press the "Update Profile" button
    Then I should be on the "profile" page
    And I should see the following:
       | John Mellencamp        |
       | Crowd Interactive      |
       | CEO                    |
       | The greatest man alive |

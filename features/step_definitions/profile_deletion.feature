# --- user story: profile deletion ---

Feature: User profile deletion
  As a college student
  I want to delete my profile and all associated data
  So that I can remove my information from the system when I no longer need it

  Scenario: User deletes their current profile from profile page
    Given I am viewing my profile page
    When I click the "Delete Profile Permanently" button
    Then my profile should be permanently deleted
    And all my meal plans and shopping lists should be deleted
    And I should be redirected to the home page
    And I should see a confirmation message

  @wip @javascript
  Scenario: User cannot accidentally delete profile without confirmation
    Given I am viewing my profile page
    When I click the "Delete Profile Permanently" button
    And I cancel the confirmation dialog
    Then my profile should not be deleted
    And I should remain on the profile page

  Scenario: User session is cleared when deleting current profile
    Given I am logged in with my profile
    When I successfully delete my profile
    Then my session should be cleared
    And I should be treated as a new user

  Scenario: User tries to delete non-existent profile
    Given I try to access a profile deletion page for a profile that doesn't exist
    Then I should be redirected to the home page
    And I should see an error message
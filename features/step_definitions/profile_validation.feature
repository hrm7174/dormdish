# --- user story: profile creation validation ---

Feature: User profile validation
  As a college student
  I want to see clear error messages when I miss required fields
  So that I can quickly fix my mistakes and create a valid profile

Scenario: User tries to create profile with missing required fields
  Given I click on the button "Get Started"
  When I click "Save Profile" without entering any information
  Then I should see validation errors for all required fields
  And I should see "Name can't be blank"
  And I should see "Weekly budget can't be blank" 
  And I should see "Must select at least one appliance"
  And I should see "Must select at least one dietary preference"

Scenario: User tries to create profile with invalid budget
  Given I click on the button "Get Started"
  When I enter my name as "Alex"
  And I set a weekly budget of 0
  And I select appliances "Microwave"
  And I select dietary preferences "Vegetarian"
  And I click the "Save Profile" button
  Then I should see "Weekly budget must be greater than 0"

Scenario: User tries to create profile with negative budget
  Given I click on the button "Get Started"
  When I enter my name as "Alex"
  And I set a weekly budget of -5
  And I select appliances "Microwave"
  And I select dietary preferences "Vegetarian"
  And I click the "Save Profile" button
  Then I should see "Weekly budget must be greater than 0"

Scenario: User fixes validation errors and successfully creates profile
  Given I am on the new profile page with validation errors
  When I enter my name as "Jamal"
  And I set a weekly budget of 25
  And I select appliances "Mini Fridge"
  And I select dietary preferences "None"
  And I click the "Save Profile" button
  Then my profile should have been saved
  And I should be redirected to the recipes page
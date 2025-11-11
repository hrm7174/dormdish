# --- user story: profile creation ---

Feature: User profile management
  As a college student
  I want to create and update my profile
  So that my meal recommendations match my budget, appliances, and dietary preferences

Scenario: User creates a profile
  Given I click on the button "Get Started"
  When I enter my name as "Heidy"
  And I set a weekly budget of 20
  And I select appliances "Microwave" and "Mini Fridge"
  And I select dietary preferences "Vegetarian"
  Then my profile should be saved
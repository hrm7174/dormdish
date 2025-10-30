# --- user story: profile creation and management ---
Feature: User profile management
  As a college student
  I want to create and update my profile
  So that my meal recommendations match my budget, appliances, and dietary preferences

Scenario: User creates a profile
  Given I click on "Get Started"
  When I enter my name as "Alice"
  And I set a weekly budget of 20
  And I select appliances "Microwave" and "Mini Fridge"
  And I select dietary preferences "Vegetarian"
  Then my profile should be saved

Scenario: User updates profile preferences
  Given I am logged in as "Alice"
  When I change dietary preference to "Vegan"
  And I update appliances to include "Hot Plate"
  Then my profile should reflect the new settings

Scenario: User immediately sees updated profile reflected in UI
  Given I am logged in as "Alice"
  When I update my weekly budget to 25
  And I change dietary preference to "Gluten-Free"
  Then I should see my profile showing weekly budget "25"
  And dietary preference "Gluten-Free"
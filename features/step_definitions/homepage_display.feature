# --- user story 4: homepage display ---
Feature: Homepage and feature overview
  As a college student
  I want to see the main feature options on the homepage
  So that I know what DormDish can do for me

Scenario: User sees homepage feature options
  Given I am on the homepage
  Then I should see "Budget-Friendly"
  And I should see "Dorm-Safe"
  And I should see "Diet-Aware"

Scenario: User navigates between pages
  Given I am logged in as "Alice"
  When I visit the homepage
  Then I should see "Budget-Friendly", "Dorm-Safe", and "Diet-Aware"
  When I click on "Recipes"
  Then I should see search and filter options

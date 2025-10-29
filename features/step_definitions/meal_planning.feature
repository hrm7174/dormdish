# --- user story 3: weekly meal planning ---
Feature: Weekly meal planning
  As a college student
  I want to view my weekly meal plan
  So that I can see breakfast, lunch, and dinner for each day and generate a shopping list

Scenario: User views weekly meal plan layout
  Given I am logged in as "Alice"
  When I click on "Weekly Meal Plan"
  Then I should see placeholders for breakfast, lunch, and dinner by day
  And I should see a button to generate a shopping list

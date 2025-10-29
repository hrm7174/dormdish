# --- user story 2: exploring recipes ---
Feature: Recipe search and filtering
  As a college student
  I want to explore recipes and filter by meal type and cost
  So that I can find meals that fit my dorm setup and budget

Scenario: User navigates to Recipes tab
  Given I am logged in as "Alice"
  When I click on "Recipes"
  Then I should see search and filter options for meal type and max cost

Scenario: User searches for recipes
  Given I am on the Recipes page
  When I search for meal type "Breakfast"
  And set max cost to 5
  Then I should see a placeholder message "No recipes yet"

Scenario: User filters recipes by meal type and max cost
  Given I am logged in as "Alice"
  When I go to the Recipes page
  And I filter recipes by meal type "Lunch"
  And set max cost to 10
  Then I should see a placeholder message "No recipes yet"
# --- user story: adding to meal plan ---

Feature: Add meals to meal plan
  As a college student
  I want to add recipes to my weekly meal plan
  So that I can organize my meals for the week

  Scenario: User adds a recipe to their meal plan
    Given I am logged in as "Heidy"
    And there are recipes in the database including "Microwave Mac & Cheese"
    When I visit the recipes page
    And I click on "View Recipe"
    And I select "Monday" as the day
    And I select "Breakfast" as the meal type
    And I click on "Add to Meal Plan"
    Then I should see "Meal added to plan!"
    And I should be on the meal plans page

  Scenario: User only sees recipes matching their profile
    Given I am logged in as "Heidy"
    And there is a recipe "Chicken Stir Fry" that requires "Hot Plate"
    And there is a recipe "Grilled Steak" that requires "Grill"
    When I visit the recipes page
    Then I should see "Chicken Stir Fry"
    And I should not see "Grilled Steak"

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

  Scenario: Verify meal is added to correct day
    Given I am logged in as "Heidy"
    And there are recipes in the database including "Overnight Oats"
    When I visit the recipes page
    And I click on "View Recipe"
    And I select "Wednesday" as the day
    And I select "Breakfast" as the meal type
    And I click on "Add to Meal Plan"
    Then I should see "Meal added to plan!"
    And I should be on the meal plans page
    And I should see the day "Wednesday" on the meal plans page
    And I should see the recipe "Overnight Oats" on the meal plans page

  Scenario: Add multiple meals to same day
    Given I am logged in as "Heidy"
    And there are recipes in the database including "Overnight Oats"
    And there are recipes in the database including "Microwave Mac & Cheese"
    When I visit the recipes page
    And I click on "View Recipe" for "Overnight Oats"
    And I select "Thursday" as the day
    And I select "Breakfast" as the meal type
    And I click on "Add to Meal Plan"
    Then I should see "Meal added to plan!"
    And I should be on the meal plans page
    And "Overnight Oats" should be in my meal plan for "Thursday" "Breakfast"
    When I go back to the recipes page
    And I click on "View Recipe" for "Microwave Mac & Cheese"
    And I select "Thursday" as the day
    And I select "Dinner" as the meal type
    And I click on "Add to Meal Plan"
    Then I should see "Meal added to plan!"
    And I should be on the meal plans page
    And "Microwave Mac & Cheese" should be in my meal plan for "Thursday" "Dinner"
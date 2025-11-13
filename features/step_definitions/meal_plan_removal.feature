# --- user story: removing from meal plan ---

Feature: Remove meals from meal plan
  As a college student
  I want to remove recipes from my weekly meal plan
  So that I can adjust my meals for the week

  Scenario: User removes a recipe from their meal plan
    Given I am logged in as "Heidy"
    And I have "Microwave Mac & Cheese" in my meal plan for "Monday" "Breakfast"
    When I visit the meal plans page
    And I click on "Remove"
    Then I should see "Meal removed from plan"
    And I should not see "Microwave Mac & Cheese"

  Scenario: User removes multiple recipes from meal plan
    Given I am logged in as "Heidy"
    And I have "Microwave Mac & Cheese" in my meal plan for "Monday" "Breakfast"
    And I have "Chicken Stir Fry" in my meal plan for "Monday" "Breakfast"
    When I visit the meal plans page
    Then I should see "Microwave Mac & Cheese"
    And I should see "Chicken Stir Fry"
    When I click on "Remove"
    Then I should see "Meal removed from plan"
    And I should still see at least one meal in the plan
Feature: Generate shopping list from meal plan
  As a college student
  I want to generate a shopping list from my meal plan
  So that I know what ingredients to buy for the week

  Scenario: User generates shopping list from meal plan with one recipe
    Given I am logged in as "Heidy"
    And I have "Overnight Oats" in my meal plan for "Monday" "Breakfast"
    When I visit the meal plans page
    And I click on "Generate Shopping List"
    Then I should be on the shopping lists page
    And I should see "Oats"
    And I should see "Milk"
    And I should see "Honey"
    And I should see "Banana"

  Scenario: User generates shopping list from meal plan with multiple recipes
    Given I am logged in as "Heidy"
    And I have "Overnight Oats" in my meal plan for "Monday" "Breakfast"
    And I have "Microwave Mac & Cheese" in my meal plan for "Tuesday" "Dinner"
    When I visit the meal plans page
    And I click on "Generate Shopping List"
    Then I should be on the shopping lists page
    And I should see ingredients from both recipes

  Scenario: User cannot generate shopping list with empty meal plan
    Given I am logged in as "Heidy"
    When I visit the meal plans page
    And I click on "Generate Shopping List"
    Then I should see "Your meal plan is empty"
    And I should see "add at least one meal"

 Scenario: Meal plan shows total weekly cost
    Given I am logged in as "Heidy"
    And I have "Overnight Oats" in my meal plan for "Monday" "Breakfast"
    And I have "Microwave Mac & Cheese" in my meal plan for "Tuesday" "Dinner"
    When I visit the meal plans page
    Then I should see "Total Weekly Cost:"
    And I should see "My Weekly Meal Plan"

  # NEW: Test deleting items from shopping list
  Scenario: User can remove items from shopping list
    Given I am logged in as "Heidy"
    And I have "Overnight Oats" in my meal plan for "Monday" "Breakfast"
    And I have "Microwave Mac & Cheese" in my meal plan for "Tuesday" "Dinner"
    When I visit the meal plans page
    And I click on "Generate Shopping List"
    Then I should be on the shopping lists page
    And I should see "Oats" in my shopping list
    When I click "Remove" next to "Oats"
    Then I should not see "Oats" in my shopping list
    And the shopping list should be updated without "Oats"

  # NEW: Test filtering shopping list by recipe
  Scenario: User can filter shopping list by recipe
    Given I am logged in as "Heidy"
    And I have "Overnight Oats" in my meal plan for "Monday" "Breakfast"
    And I have "Microwave Mac & Cheese" in my meal plan for "Tuesday" "Dinner"
    When I visit the meal plans page
    And I click on "Generate Shopping List"
    Then I should be on the shopping lists page
    And I should see "Filter by Recipe" dropdown
    When I select "Overnight Oats" from the filter dropdown
    Then I should see ingredients used in "Overnight Oats"
    And I should not see ingredients used only in "Microwave Mac & Cheese"
    When I select "All Recipes" from the filter dropdown
    Then I should see ingredients from all recipes again

  Scenario: User with empty meal plan tries to access shopping list directly
    Given I am logged in as "Heidy"
    And I have no recipes in my meal plan
    When I visit the shopping lists page directly
    Then I should be redirected to the meal plans page
    And I should see "Please add at least one meal to your meal plan"

  Scenario: User tries to remove non-existent ingredient
    Given I am logged in as "Heidy"
    And I have a shopping list with "Milk" but not "Eggs"
    When I try to remove "Eggs" from the shopping list
    Then the shopping list should remain unchanged
    And I should see a notice saying "Eggs removed from shopping list"

  Scenario: User tries to remove ingredient from empty shopping list
    Given I am logged in as "Heidy"
    And I have an empty shopping list
    When I try to remove any ingredient
    Then the shopping list should remain empty
    And no error should occur
  
  Scenario: User tries to view non-existent shopping list
    Given I am logged in as "Heidy"
    When I visit a shopping list page with an invalid ID
    Then I should see a "record not found" error

    
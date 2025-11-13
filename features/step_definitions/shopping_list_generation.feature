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
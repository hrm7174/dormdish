Feature: Filter recipes
  As a user
  I want to filter recipes by search, meal type, and max cost
  So that I can find recipes that match my preferences

  Scenario: Filtering recipes by name
    Given I am on the recipes page
    And there are recipes in the database including "Microwave Mac & Cheese"
    When I fill in "Microwave Mac & Cheese" in the search field
    And I click the "Filter" button
    Then I should see "Microwave Mac & Cheese" in the list
    And I should not see recipes that do not match the search

  Scenario: Filtering recipes by meal type
    Given I am on the recipes page
    When I select "Breakfast" from the meal type dropdown
    And I click the "Filter" button
    Then I should only see recipes with the meal type "Breakfast"
    And I should not see recipes of other meal types

  Scenario: Filtering recipes by max cost
    Given I am on the recipes page
    When I fill in "5" in the max cost field
    And I click the "Filter" button
    Then I should only see recipes with a cost of $5.00 or less
    And I should not see recipes that cost more than $5.00

  Scenario: Filtering recipes by name and meal type
    Given I am on the recipes page
    When I fill in "Overnight Oats" in the search field
    And I select "Breakfast" from the meal type dropdown
    And I click the "Filter" button
    Then I should see "Overnight Oats" in the list
    And I should not see recipes that do not match both criteria

  Scenario: Filtering recipes by meal type and max cost
    Given I am on the recipes page
    When I select "Dinner" from the meal type dropdown
    And I fill in "5" in the max cost field
    And I click the "Filter" button
    Then I should see only dinner recipes costing $5.00 or less
    And I should not see recipes that do not meet both criteria

  Scenario: Filtering with no matching results
    Given I am on the recipes page
    When I fill in "Nonexistent Recipe" in the search field
    And I click the "Filter" button
    Then I should see a message "No recipes matched your filters"

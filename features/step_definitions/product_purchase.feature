Feature: Search for products to purchase
  As a college student
  I want to search for ingredients I need
  So that I can see where to buy them and how much they cost

  Scenario: User searches for an ingredient and finds products
    Given I am logged in as "Heidy"
    And I have "Overnight Oats" in my meal plan for "Monday" "Breakfast"
    When I visit the meal plans page
    And I click on "Generate Shopping List"
    And I click on "Purchase"
    Then I should see products for the ingredient
    And I should see prices and store information

  Scenario: User searches for ingredient with no results
    When I visit the products search page for "Unicorn Tears"
    Then I should see "No products found"

  Scenario: User sees products sorted by price
    When I visit the products search page for "Onion"
    Then the products should be sorted by price from lowest to highest

  Scenario: User filters products by store
    Given I am logged in as "Heidy"
    When I visit the products search page for "Bread"
    And I select "Westside" from the store filter
    And I click the "Filter" button
    Then I should only see products from "Westside"
    And I should not see products from "Hmart"

  Scenario: User filters products by maximum price
    Given I am logged in as "Heidy"
    When I visit the products search page for "Bread"
    And I fill in "3.00" in the max cost filter
    And I click the "Filter" button
    Then I should only see products costing $3.00 or less
    And I should not see products costing more than $3.00

  Scenario: User filters products by minimum price
    Given I am logged in as "Heidy"
    When I visit the products search page for "Bread"
    And I fill in "3.00" in the min cost filter
    And I click the "Filter" button
    Then I should only see products costing $3.00 or more

  Scenario: User filters by both store and price range
    Given I am logged in as "Heidy"
    When I visit the products search page for "Bread"
    And I select "Westside" from the store filter
    And I fill in "2.00" in the min cost filter
    And I fill in "3.50" in the max cost filter
    And I click the "Filter" button
    Then I should only see "Westside" products between $2.00 and $3.50

  Scenario: User resets filters
    Given I am logged in as "Heidy"
    When I visit the products search page for "Bread"
    And I select "Westside" from the store filter
    And I click the "Filter" button
    And I click on "Reset"
    Then I should see products from all stores

  Scenario: User sorts products by price high to low
    Given I am logged in as "Heidy"
    When I visit the products search page for "Bread"
    And I select "Price: High → Low" from the sort by dropdown
    And I click the "Filter" button
    Then the products should be sorted by price from highest to lowest
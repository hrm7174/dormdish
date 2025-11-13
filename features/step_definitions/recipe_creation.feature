Feature: Create new recipes
  As a college student
  I want to add my own recipes to the app
  So that I can cook meals that I know and like

  Scenario: User creates a new recipe successfully
    Given I am logged in as "Heidy"
    When I visit the recipes page
    And I click on "Add A Recipe"
    Then I should be on the new recipe page
    When I fill in "Name" with "Oreo Cake"
    And I select "Breakfast" from the meal type field
    And I fill in "Prep Time (min)" with "5"
    And I fill in "Cost ($)" with "6"
    And I fill in the ingredients with "Oreos" and "Milk"
    And I fill in the instructions with "Crush oreos in a cup, mix in milk, and microwave."
    And I select dietary tag "Vegetarian"
    And I select appliance "Microwave"
    And I click on "Save Recipe"
    Then I should see "Recipe created successfully!"
    And I should see "Oreo Cake"
    And I should see "Oreos"
    And I should see "Milk"

  Scenario: User tries to create recipe without required fields
    Given I am logged in as "Heidy"
    When I visit the recipes page
    And I click on "Add A Recipe"
    And I click on "Save Recipe"
    Then I should see "Could not create recipe"
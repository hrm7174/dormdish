# --- user story 1: profile creation and management ---
Feature: User profile management
  As a college student
  I want to create and update my profile
  So that my meal recommendations match my budget, appliances, and dietary preferences

Scenario: User creates a profile
  Given I click on "Get Started"
  When I enter my name as "Alice"
  And I set a weekly budget of 20
  And I select appliances "Microwave" and "Mini Fridge"
  And I select dietary preferences "Vegetarian"
  Then my profile should be saved

Scenario: User updates profile preferences
  Given I am logged in as "Alice"
  When I change dietary preference to "Vegan"
  And I update appliances to include "Hot Plate"
  Then my profile should reflect the new settings

Scenario: User immediately sees updated profile reflected in UI
  Given I am logged in as "Alice"
  When I update my weekly budget to 25
  And I change dietary preference to "Gluten-Free"
  Then I should see my profile showing weekly budget "25"
  And dietary preference "Gluten-Free"


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


# --- user story 4: homepage display ---
Feature: Homepage and feature overview
  As a college student
  I want to see the main feature options on the homepage
  So that I know what DormDish can do for me

Scenario: User sees homepage feature options
  Given I am on the homepage
  Then I should see "Budget-Friendly"
  And I should see "Dorm-Safe"
  And I should see "Diet-Aware"

Scenario: User navigates between pages
  Given I am logged in as "Alice"
  When I visit the homepage
  Then I should see "Budget-Friendly", "Dorm-Safe", and "Diet-Aware"
  When I click on "Recipes"
  Then I should see search and filter options

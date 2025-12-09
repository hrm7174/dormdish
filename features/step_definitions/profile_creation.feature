# --- user story: profile creation ---

Feature: User profile management
  As a college student
  I want to create and update my profile
  So that my meal recommendations match my budget, appliances, and dietary preferences

Scenario: User creates a profile
  Given I click on the button "Get Started"
  When I enter my name as "Heidy"
  And I set a weekly budget of 20
  And I select appliances "Microwave" and "Mini Fridge"
  And I select dietary preferences "Vegetarian"
  Then my profile should be saved

Scenario: User edits their weekly budget
  Given I am logged in as "Heidy"
  When I navigate to my profile page
  And I update my weekly budget to 75
  Then I should see my profile showing weekly budget "75"

Scenario: User changes their dietary preferences
  Given I am logged in as "Heidy"
  When I navigate to my profile page
  And I change dietary preference to "Vegan"
  Then I should see my profile showing dietary preference "Vegan"
# frozen_string_literal: true

require "capybara/rails"
require "capybara/cucumber"

Given("I am logged in as {string}") do |name|
  visit root_path
  click_on "Get Started", match: :first

  fill_in "Your Name", with: name
  fill_in "Weekly Budget ($)", with: 50
  select "Microwave", from: "user_profile_appliances"
  select "Mini Fridge", from: "user_profile_appliances"
  select "Hot Plate", from: "user_profile_appliances"
  select "Vegetarian", from: "user_profile_dietary_preferences"
  click_button "Save Profile"
end

When("I select appliances {string} and {string}") do |appliance1, appliance2|
  select appliance1, from: "user_profile_appliances"
  select appliance2, from: "user_profile_appliances"
end

When("I select dietary preferences {string}") do |preference|
  select preference, from: "user_profile_dietary_preferences"
end

Given("I am on the homepage") do
  visit root_path
end

When("I visit the homepage") do
  visit root_path
end

'''Line to make recipe visible'''
Given('I click on the button {string}') do |button_text|
  visit root_path
  all('a', text: button_text, visible: :all).last.click
end

Then("I should see {string}") do |text|
  expect(page).to have_content(text)
end

Then("I should see {string}, {string}, and {string}") do |text1, text2, text3|
  expect(page).to have_content(text1)
  expect(page).to have_content(text2)
  expect(page).to have_content(text3)
end

When('I click on {string}') do |text|
  click_on text, match: :first
end

When("I enter my name as {string}") do |name|
  fill_in "Your Name", with: name
end

When("I set a weekly budget of {int}") do |budget|
  fill_in "Weekly Budget ($)", with: budget
end


Then("my profile should be saved") do
  click_button "Save Profile"
  expect(UserProfile.last).not_to be_nil
  expect(UserProfile.last.name).to eq("Heidy")
end

When("I update my weekly budget to {int}") do |budget|
  fill_in "Weekly Budget", with: budget
  click_button "Update"
end

When("I change dietary preference to {string}") do |preference|
  uncheck @user_profile.dietary_preferences.first
  check preference
  click_button "Update"
end

Then("I should see my profile showing weekly budget {string}") do |budget|
  expect(page).to have_content(budget)
end

Then("dietary preference {string}") do |preference|
  expect(page).to have_content(preference)
end

Given("I am on the recipes page") do
  visit recipes_path
end

Given("there are recipes in the database including {string}") do |recipe_name|
  Recipe.find_or_create_by!(name: recipe_name) do |r|
    r.meal_type = "breakfast"
    r.prep_time = 10
    r.cost = 5.0
    r.dietary_tags = [ "Vegetarian" ]
    r.ingredients = "test"
  end
end

When('I fill in {string} in the search field') do |search_text|
  fill_in "search", with: search_text
end

When('I select {string} from the meal type dropdown') do |meal_type|
  select meal_type, from: "meal_type"
end

When('I fill in {string} in the max cost field') do |cost|
  fill_in "max_cost", with: cost
end

When('I click the {string} button') do |button_text|
  click_button(button_text)
end

Then('I should only see recipes with the meal type {string}') do |meal_type|
  Recipe.where(meal_type: meal_type).each do |recipe|
    expect(page).to have_content(recipe.name)
  end
end

Then('I should not see recipes of other meal types') do
  Recipe.where.not(meal_type: "breakfast").each do |recipe|
    expect(page).not_to have_content(recipe.name)
  end
end

Then('I should only see recipes with a cost of ${float} or less') do |max_cost|
  Recipe.where("cost <= ?", max_cost).each do |recipe|
    expect(page).to have_content(recipe.name)
  end
end

Then('I should not see recipes that cost more than ${float}') do |max_cost|
  Recipe.where("cost > ?", max_cost).each do |recipe|
    expect(page).not_to have_content(recipe.name)
  end
end

Then('I should see a search option') do
  expect(page).to have_field("search")
end

Then('I should see {string} in the list') do |recipe_name|
  expect(page).to have_content(recipe_name)
end

Then('I should not see recipes that do not match both criteria') do
  visible_recipes = Recipe.all.select do |recipe|
    page.has_content?(recipe.name)
  end
  # expect(visible_recipes).to all(satisfy { |r| r.name.include?("Overnight Oats") || r.meal_type == "Breakfast" })
end

Then('I should see only dinner recipes costing ${float} or less') do |max_cost|
  Recipe.where(meal_type: "dinner").where("cost <= ?", max_cost).each do |recipe|
    expect(page).to have_content(recipe.name)
  end
end



Given('I am on the new profile page') do
  visit new_user_profile_path
end

Given('I am on the new profile page with validation errors') do
  visit new_user_profile_path
  click_button "Save Profile" # This will trigger validation errors
end

When('I click {string} without entering any information') do |button_text|
  click_button button_text
end

Then('I should see validation errors for all required fields') do
  expect(page).to have_content("error") # Looks for "error" or "errors" in the message
end

Then('I should see {string} must be greater than {int}') do |field, value|
  expect(page).to have_content("#{field} must be greater than #{value}")
end

When('I fill in all required fields with valid data') do
  fill_in "Your Name", with: "Valid User"
  fill_in "Weekly Budget ($)", with: 30
  select "Microwave", from: "Available Appliances"
  select "Vegetarian", from: "Dietary Preferences"
end

Then('I should not see any error messages') do
  expect(page).not_to have_css('.alert-danger')
  expect(page).not_to have_content("can't be blank")
  expect(page).not_to have_content("Must select")
end

When('I select appliances {string}') do |appliance|
  select appliance, from: "user_profile_appliances"
end

When('I click {string}') do |button_text|
  click_button button_text
end

Then('I should be redirected to the recipes page') do
  expect(current_path).to eq(recipes_path)
end

Then("my profile should have been saved") do
  expect(UserProfile.last).not_to be_nil
  expect(UserProfile.last.name).to be_present
end

Given('there is a recipe {string} that requires {string}') do |recipe_name, appliance|
  Recipe.find_or_create_by!(name: recipe_name) do |r|
    r.meal_type = "dinner"
    r.prep_time = 20
    r.cost = 8.0
    r.dietary_tags = [ "Vegetarian" ]
    r.appliances_needed = [ appliance ]
    r.ingredients = "test ingredients"
    r.instructions = "test instructions"
  end
end

When('I visit the recipes page') do
  visit recipes_path
end

When('I select {string} as the day') do |day|
  select day, from: "day"
end

When('I select {string} as the meal type') do |meal_type|
  select meal_type, from: "meal_type"
end

Then('I should be on the meal plans page') do
  expect(current_path).to eq(meal_plans_path)
end

Then('I should not see {string}') do |text|
  expect(page).not_to have_content(text)
end

Given('I have {string} in my meal plan for {string} {string}') do |recipe_name, day, meal_type|
  ingredients_list = if recipe_name == "Overnight Oats"
    [ "Oats", "Milk", "Honey", "Banana" ]
  elsif recipe_name == "Microwave Mac & Cheese"
    [ "Pasta", "Cheese", "Milk" ]
  else
    [ "test ingredients" ]
  end

  recipe = Recipe.find_or_create_by!(name: recipe_name) do |r|
    r.meal_type = meal_type.downcase
    r.prep_time = 10
    r.cost = 3.50
    r.dietary_tags = [ "Vegetarian" ]
    r.appliances_needed = [ "Microwave" ]
    r.ingredients = ingredients_list.join(", ")
    r.ingredients_list = ingredients_list
    r.instructions = "test instructions"
  end

  # Get the current user profile
  user_profile = UserProfile.find_by(name: "Heidy")

  # Create a meal plan entry WITH day and meal_type
  MealPlan.create!(
    user_profile: user_profile,
    recipe: recipe,
    day: day,
    meal_type: meal_type.downcase
  )
end

When('I visit the meal plans page') do
  visit meal_plans_path
end

Then('I should still see at least one meal in the plan') do
  expect(page).to have_css('.card-body', minimum: 1)
  expect(MealPlan.count).to be > 0
end

Then('I should be on the shopping lists page') do
  expect(current_path).to match(/shopping_lists/)
end

Then('I should see ingredients from both recipes') do
  # Check that at least some ingredients are visible
  expect(page).to have_content('Oats')
  expect(page).to have_content('Pasta')
end

When('I visit the shopping lists page') do
  visit shopping_lists_path
end

When('I visit the check meal plan page') do
  visit check_meal_plan_shopping_lists_path
end

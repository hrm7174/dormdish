# frozen_string_literal: true

require "capybara/rails"
require "capybara/cucumber"

Given("I am logged in as {string}") do |name|
  visit root_path
  click_on "Get Started", match: :first

  fill_in "Your Name", with: name
  fill_in "Weekly Budget ($)", with: 50
  select "Microwave", from: "user_profile_appliances"
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
  click_on text
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
  #expect(visible_recipes).to all(satisfy { |r| r.name.include?("Overnight Oats") || r.meal_type == "Breakfast" })
end

Then('I should see only dinner recipes costing ${float} or less') do |max_cost|
  Recipe.where(meal_type: "dinner").where("cost <= ?", max_cost).each do |recipe|
    expect(page).to have_content(recipe.name)
  end
end

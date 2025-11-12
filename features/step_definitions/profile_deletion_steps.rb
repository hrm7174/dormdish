# frozen_string_literal: true

require "capybara/rails"
require "capybara/cucumber"

Given('I am viewing my profile page') do
    @user_profile = UserProfile.create!(
      name: "Alex",
      weekly_budget: 30,
      appliances: [ "Microwave" ],
      dietary_preferences: [ "Vegetarian" ]
    )
    visit user_profile_path(@user_profile)
  end

  When('I confirm the deletion') do
  end

  When('I cancel the confirmation dialog') do
  end

  Then('my profile should be permanently deleted') do
    expect(UserProfile.exists?(@user_profile.id)).to be false
  end

  Then('all my meal plans and shopping lists should be deleted') do
    expect(MealPlan.where(user_profile_id: @user_profile.id).count).to eq(0)
    expect(ShoppingList.where(user_profile_id: @user_profile.id).count).to eq(0)
  end

  Then('I should be redirected to the home page') do
    expect(current_path).to eq(root_path)
  end

  Then('I should see a confirmation message') do
    expect(page).to have_content("all associated data have been deleted")
  end

  Then('my profile should not be deleted') do
    expect(UserProfile.exists?(@user_profile.id)).to be true
  end

  Then('I should remain on the profile page') do
    expect(current_path).to eq(user_profile_path(@user_profile))
  end

  Given('I am logged in with my profile') do
    @user_profile = UserProfile.create!(
      name: "Alex",
      weekly_budget: 30,
      appliances: [ "Microwave" ],
      dietary_preferences: [ "Vegetarian" ]
    )
    page.driver.browser.set_cookie("user_profile_id=#{@user_profile.id}")
  end

  When('I successfully delete my profile') do
    visit user_profile_path(@user_profile)
    click_button "Delete Profile Permanently"
  end

  Then('my session should be cleared') do
    expect(current_path).to eq(root_path)
    expect(page).to have_content("Get Started")
  end

  Then('I should be treated as a new user') do
    expect(page).to have_content("Get Started")
  end

  Given('I try to access a profile deletion page for a profile that doesn\'t exist') do
    visit user_profile_path(99999) # Non-existent ID
  end

  Then('I should see an error message') do
    expect(page).to have_content("Profile not found")
  end

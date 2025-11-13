# spec/requests/shopping_lists_spec.rb
require "rails_helper"

RSpec.describe "ShoppingLists", type: :request do
  let!(:profile) do
    UserProfile.create!(
      name: "Alex",
      weekly_budget: 30,
      appliances: [ "Microwave" ],
      dietary_preferences: [ "None" ]
    )
  end

  let!(:recipe) do
    Recipe.create!(
      name: "Dorm Mac",
      meal_type: "dinner",
      cost: 3
    )
  end

  let!(:meal_plan) do
    MealPlan.create!(
      user_profile: profile,
      recipe: recipe,
      day: "Monday",
      meal_type: "Dinner"
    )
  end

  before do
    allow_any_instance_of(ApplicationController)
      .to receive(:current_profile)
      .and_return(profile)
  end

  describe "GET /shopping_lists" do
    it "renders the index successfully when meal plans exist" do
      profile.shopping_lists.create!(
        items: [
          { "name" => "Pasta", "recipes" => [ recipe.name ], "purchased" => false },
          { "name" => "Cheese", "recipes" => [ recipe.name ], "purchased" => true }
        ]
      )

      get "/shopping_lists"

      expect(response).to have_http_status(:ok)
      expect(response.body).to include("Pasta")
      expect(response.body).to include("Cheese")
    end
  end

  describe "GET /shopping_lists/:id" do
    it "renders the show page successfully" do
      list = profile.shopping_lists.create!(
        items: [
          { "name" => "Milk", "recipes" => [ recipe.name ] }
        ]
      )

      # Make sure the view sees hashes with :name so item[:name].parameterize works
      allow_any_instance_of(ShoppingList)
        .to receive(:items)
        .and_return([ { name: "Milk", recipes: [ recipe.name ] } ])

      get "/shopping_lists/#{list.id}"

      expect(response).to have_http_status(:ok)
      expect(response.body).to include("Milk")
    end
  end

  describe "GET /shopping_lists/check_meal_plan" do
    it "redirects to shopping_lists when meal plans exist" do
      get "/shopping_lists/check_meal_plan"

      expect(response).to redirect_to(shopping_lists_path)
    end

    it "renders the empty_meal_plan page when no meals exist" do
      empty_profile = UserProfile.create!(
        name: "Sam",
        weekly_budget: 20,
        appliances: [ "Microwave" ],
        dietary_preferences: [ "None" ]
      )

      allow_any_instance_of(ApplicationController)
        .to receive(:current_profile)
        .and_return(empty_profile)

      get "/shopping_lists/check_meal_plan"

      expect(response).to have_http_status(:ok)
      # Optional: ensure we really hit the empty-meal-plan page
      expect(response.body).to include("Your Meal Plan is Empty")
                              .or include("Cannot Generate Shopping List")
    end
  end

  describe "GET /shopping_lists when meal plan is empty" do
    it "redirects back to meal_plans with an alert" do
      empty_profile = UserProfile.create!(
        name: "Jordan",
        weekly_budget: 25,
        appliances: [ "Microwave" ],
        dietary_preferences: [ "None" ]
      )

      allow_any_instance_of(ApplicationController)
        .to receive(:current_profile)
        .and_return(empty_profile)

      get "/shopping_lists"

      expect(response).to redirect_to(meal_plans_path)
      expect(flash[:alert]).to match(/add at least one meal/i)
    end
  end
end

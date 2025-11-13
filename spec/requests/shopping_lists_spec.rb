# spec/requests/shopping_lists_spec.rb
require "rails_helper"

RSpec.describe "ShoppingLists", type: :request do
  let!(:user_profile) do
    UserProfile.create!(
      name: "Heidy",
      weekly_budget: 25,
      appliances: [ "Microwave" ],
      dietary_preferences: [ "Vegetarian" ]
    )
  end

  let!(:recipe) do
    Recipe.create!(
      name: "Microwave Mac & Cheese",
      meal_type: "Dinner",
      prep_time: 10,
      cost: 3.5,
      appliances_needed: [ "Microwave" ],
      dietary_tags: [ "Vegetarian" ],
      ingredients: "Pasta, Cheese, Milk"
    )
  end

  let!(:meal_plan) do
    MealPlan.create!(
      user_profile: user_profile,
      recipe: recipe,
      day: "Monday",
      meal_type: "Dinner"
    )
  end

  let!(:shopping_list) do
    ShoppingList.create!(
      user_profile: user_profile,
      meal_plan: meal_plan,
      items: [ "Pasta", "Cheese" ]
    )
  end

  before do
    allow_any_instance_of(ApplicationController)
      .to receive(:current_profile)
      .and_return(user_profile)
  end

  describe "GET /shopping_lists" do
    it "renders the index successfully when meal plans exist" do
      get shopping_lists_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET /shopping_lists/:id" do
    it "renders the show page successfully" do
      get shopping_list_path(shopping_list)
      expect(response).to have_http_status(:ok)
      expect(response.body).to include("Pasta")
    end
  end

  describe "GET /shopping_lists/check_meal_plan" do
    it "redirects to shopping_lists when meal plans exist" do
      get check_meal_plan_shopping_lists_path
      expect(response).to redirect_to(shopping_lists_path)
    end

    it "renders the empty_meal_plan page when no meals exist" do
      empty_profile = UserProfile.create!(
        name: "Empty",
        weekly_budget: 10,
        appliances: [ "Microwave" ],
        dietary_preferences: [ "Vegetarian" ]
      )

      allow_any_instance_of(ApplicationController)
        .to receive(:current_profile)
        .and_return(empty_profile)

      MealPlan.where(user_profile: empty_profile).delete_all

      get check_meal_plan_shopping_lists_path

      expect(response).to have_http_status(:ok)
      expect(response.body).to include("Your Meal Plan is Empty")
    end
  end

  describe "GET /shopping_lists when meal plan is empty" do
    it "redirects back to meal_plans with an alert" do
      empty_profile = UserProfile.create!(
        name: "No Meals",
        weekly_budget: 15,
        appliances: [ "Microwave" ],
        dietary_preferences: [ "Vegetarian" ]
      )

      allow_any_instance_of(ApplicationController)
        .to receive(:current_profile)
        .and_return(empty_profile)

      get shopping_lists_path

      expect(response).to redirect_to(meal_plans_path)
      expect(flash[:alert]).to be_present
    end
  end
end

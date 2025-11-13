# spec/requests/meal_plans_spec.rb
require "rails_helper"

RSpec.describe "MealPlans", type: :request do
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
      name: "Overnight Oats",
      meal_type: "Breakfast",
      prep_time: 5,
      cost: 2.0,
      appliances_needed: [],
      dietary_tags: [ "Vegetarian" ],
      ingredients: "Oats, Milk, Honey"
    )
  end

  before do
    allow_any_instance_of(ApplicationController)
      .to receive(:current_profile)
      .and_return(user_profile)
  end

  describe "GET /meal_plans" do
    it "renders the index successfully and shows a meal" do
      MealPlan.create!(
        user_profile: user_profile,
        recipe: recipe,
        day: "Monday",
        meal_type: "Breakfast"
      )

      get meal_plans_path
      expect(response).to have_http_status(:ok)
      expect(response.body).to include("Meal Plan")
    end
  end

  describe "POST /meal_plans" do
    it "creates a meal plan and redirects to index" do
      expect do
        post meal_plans_path, params: {
          recipe_id: recipe.id,
          day: "Tuesday",
          meal_type: "Dinner"
        }
      end.to change(MealPlan, :count).by(1)

      expect(response).to redirect_to(meal_plans_path)
      follow_redirect!
      expect(response.body).to include("Meal added to plan").or include("Meal Plan")
    end
  end

  describe "DELETE /meal_plans/:id" do
    it "destroys a meal plan and redirects to index" do
      meal_plan = MealPlan.create!(
        user_profile: user_profile,
        recipe: recipe,
        day: "Wednesday",
        meal_type: "Dinner"
      )

      expect do
        delete meal_plan_path(meal_plan)
      end.to change(MealPlan, :count).by(-1)

      expect(response).to redirect_to(meal_plans_path)
    end
  end

  describe "POST /meal_plans when save fails" do
    it "redirects back to recipes with an alert" do
      profile = UserProfile.create!(
        name: "Planner",
        weekly_budget: 40,
        appliances: [ "Microwave" ],
        dietary_preferences: [ "None" ]
      )

      recipe = Recipe.create!(
        name: "Toast",
        meal_type: "breakfast",
        cost: 1
      )

      # Force any MealPlan save to fail so we hit the else branch
      allow_any_instance_of(MealPlan).to receive(:save).and_return(false)

      post meal_plans_path, params: {
        recipe_id: recipe.id,
        day: "Monday",
        meal_type: "Breakfast"
      }

      # redirect_back falls back to recipes_path in tests
      expect(response).to redirect_to(recipes_path)
      expect(flash[:alert]).to eq("Could not add meal.")
    end
  end
end

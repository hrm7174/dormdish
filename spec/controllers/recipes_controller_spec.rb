require "rails_helper"

RSpec.describe RecipesController, type: :controller do
  let(:profile) do
    UserProfile.create!(
      name: "Alex",
      weekly_budget: 50,
      appliances: ["Microwave"],
      dietary_preferences: ["Vegetarian"]
    )
  end

  before { session[:user_profile_id] = profile.id }

  describe "GET #index" do
    let!(:mac) { Recipe.create!(name: "Microwave Mac & Cheese", meal_type: "dinner", prep_time: 10, cost: 3.5, appliances_needed: ["Microwave"], dietary_tags: ["Vegetarian"], ingredients: "pasta") }
    let!(:oats) { Recipe.create!(name: "Overnight Oats", meal_type: "breakfast", prep_time: 5, cost: 2.0, dietary_tags: ["Vegetarian"], ingredients: "oats") }
    let!(:stirfry) { Recipe.create!(name: "Chicken Stir Fry", meal_type: "dinner", prep_time: 20, cost: 8.0, appliances_needed: ["Hot Plate"], dietary_tags: [], ingredients: "chicken") }

    it "is successful" do
      get :index
      expect(response).to be_successful
    end

    it "filters compatible recipes" do
      get :index
      expect(assigns(:recipes)).to include(mac, oats)
      expect(assigns(:recipes)).not_to include(stirfry)
    end
  end
end
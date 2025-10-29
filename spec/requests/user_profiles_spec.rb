# frozen_string_literal: true
require "rails_helper"

RSpec.describe "UserProfiles", type: :request do
  describe "GET /user_profiles/new" do
    it "renders the new profile form" do
      get new_user_profile_path
      expect(response).to have_http_status(:ok)
      expect(response.body).to include("Create Your DormDish Profile").or include("Profile")
    end
  end

  describe "POST /user_profiles" do
    it "redirects to recipes on success" do
      post user_profiles_path, params: {
        user_profile: {
          name: "Heidy",
          weekly_budget: 25,
          available_appliances: ["Microwave", "Mini Fridge"],
          dietary_preferences: ["Vegetarian"]
        }
      }
      expect(response).to redirect_to(recipes_path)
      follow_redirect!
      expect(response).to have_http_status(:ok)
      expect(response.body).to include("Recipes").or include("Browse Recipes")
    end

    it "re-renders new with validation errors on failure" do
      post user_profiles_path, params: {
        user_profile: { name: "", weekly_budget: "" }
      }
      expect(response).to have_http_status(:unprocessable_entity).or have_http_status(:ok)
      expect(response.body).to match(/can&#39;t be blank|can't be blank/i)
      expect(response.body).to include("Create Your DormDish Profile").or include("Profile")
    end
  end

  describe "GET /user_profiles/:id" do
    it "shows an existing profile" do
      profile = UserProfile.create!(name: "Alex", weekly_budget: 50)
      get user_profile_path(profile)
      expect(response).to have_http_status(:ok)
      expect(response.body).to include("Alex")
    end
  end
end

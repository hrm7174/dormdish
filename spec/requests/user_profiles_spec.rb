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
          available_appliances: [ "Microwave", "Mini Fridge" ],
          dietary_preferences: [ "Vegetarian" ]
        }
      }
      expect(response).to redirect_to(recipes_path)
      follow_redirect!
      expect(response).to have_http_status(:ok)
      expect(response.body).to include("Recipes").or include("Browse Recipes")
    end

    it "stores the created profile id in session" do
        post user_profiles_path, params: {
          user_profile: {
            name: "Heidy",
            weekly_budget: 25,
            available_appliances: [ "Microwave" ],
            dietary_preferences: [ "Vegetarian" ]
          }
        }

        expect(response).to redirect_to(recipes_path)
        expect(session[:user_profile_id]).to be_present
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

  describe "PATCH /user_profiles/:id" do
    it "updates an existing profile and redirects" do
      profile = UserProfile.create!(name: "Alice", weekly_budget: 10)

      patch user_profile_path(profile), params: { user_profile: { weekly_budget: 15 } }

      expect(response).to redirect_to(user_profile_path(profile))
      # No follow_redirect! to avoid layout helper dependencies
    end
  end

  ## PROFILE DELETION 
  describe "DELETE /user_profiles/:id" do
    it "deletes the profile and redirects to root with notice" do
      profile = UserProfile.create!(name: "Test User", weekly_budget: 30)
      
      delete user_profile_path(profile)
      
      expect(response).to redirect_to(root_path)
      expect(flash[:notice]).to match(/Profile 'Test User' and all associated data have been deleted/)
      expect(UserProfile.exists?(profile.id)).to be false
    end

    it "clears session when deleting the current profile" do
      profile = UserProfile.create!(name: "Test User", weekly_budget: 30)
      
      post user_profiles_path, params: {
        user_profile: {
          name: "Test User",
          weekly_budget: 30,
          appliances: ["Microwave"],
          dietary_preferences: ["Vegetarian"]
        }
      }
      expect(session[:user_profile_id]).to be_present
      
      delete user_profile_path(profile)
      
      expect(session[:user_profile_id]).to be_nil
    end

    it "redirects to root with alert when profile not found" do
      delete user_profile_path(99999) # Non-existent ID
      
      expect(response).to redirect_to(root_path)
      expect(flash[:alert]).to eq("Profile not found.")
    end

    it "destroys associated meal plans and shopping lists" do
      profile = UserProfile.create!(name: "Test User", weekly_budget: 30)
      meal_plan = profile.meal_plans.create!(name: "Test Plan")
      shopping_list = profile.shopping_lists.create!(name: "Test List")
      
      expect do
        delete user_profile_path(profile)
      end.to change(MealPlan, :count).by(-1)
       .and change(ShoppingList, :count).by(-1)
    end
  end


end

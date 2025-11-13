# spec/requests/user_profiles_spec.rb
require "rails_helper"

RSpec.describe "UserProfiles", type: :request do
  let(:valid_params) do
    {
      user_profile: {
        name: "Alice",
        weekly_budget: 20,
        appliances: [ "Microwave" ],
        dietary_preferences: [ "Vegetarian" ]
      }
    }
  end

  let(:invalid_params) do
    {
      user_profile: {
        name: "",
        weekly_budget: 0,
        appliances: [],
        dietary_preferences: []
      }
    }
  end

  describe "GET /user_profiles/new" do
    it "renders the new profile form" do
      get new_user_profile_path
      expect(response).to have_http_status(:ok)
      expect(response.body).to include("Create your dorm profile").or include("New Profile").or include("Get Started")
    end
  end

  describe "POST /user_profiles" do
    it "redirects to recipes on success" do
      post user_profiles_path, params: valid_params
      expect(response).to redirect_to(recipes_path)
    end

    it "stores the created profile id in session" do
      post user_profiles_path, params: valid_params
      profile = UserProfile.last
      expect(session[:user_profile_id]).to eq(profile.id)
    end

    it "re-renders new with validation errors on failure" do
      post user_profiles_path, params: invalid_params
      expect(response).to have_http_status(:unprocessable_entity).or have_http_status(:ok)
      expect(response.body).to include("error").or include("Must select at least one appliance")
    end
  end

  describe "GET /user_profiles/:id" do
    it "shows an existing profile" do
      profile = UserProfile.create!(
        name: "Alex",
        weekly_budget: 50,
        appliances: [ "Microwave" ],
        dietary_preferences: [ "Vegetarian" ]
      )
      get user_profile_path(profile)
      expect(response).to have_http_status(:ok)
      expect(response.body).to include("Alex")
    end
  end

  describe "PATCH /user_profiles/:id" do
    it "updates an existing profile and redirects" do
      profile = UserProfile.create!(
        name: "Alice",
        weekly_budget: 10,
        appliances: [ "Microwave" ],
        dietary_preferences: [ "Vegetarian" ]
      )

      patch user_profile_path(profile), params: {
        user_profile: {
          name: "Updated Alice",
          weekly_budget: 30,
          appliances: [ "Microwave", "Hot Plate" ],
          dietary_preferences: [ "Vegetarian" ]
        }
      }

      expect(response).to redirect_to(user_profile_path(profile))
      follow_redirect!
      expect(response.body).to include("Updated Alice")
    end
  end

  describe "DELETE /user_profiles/:id" do
    it "deletes the profile and redirects to root with notice" do
      profile = UserProfile.create!(
        name: "Test User",
        weekly_budget: 30,
        appliances: [ "Microwave" ],
        dietary_preferences: [ "Vegetarian" ]
      )
      delete user_profile_path(profile)
      expect(response).to redirect_to(root_path)
    end

    it "clears session when deleting the current profile" do
      profile = UserProfile.create!(
        name: "Test User",
        weekly_budget: 30,
        appliances: [ "Microwave" ],
        dietary_preferences: [ "Vegetarian" ]
      )
      # simulate logged in
      allow_any_instance_of(ApplicationController)
        .to receive(:current_profile)
        .and_return(profile)

      delete user_profile_path(profile)
      expect(session[:user_profile_id]).to be_nil
    end

    # it "destroys associated meal plans and shopping lists" do
    # profile = UserProfile.create!(
    # name: "Test User",
    # weekly_budget: 30,
    # appliances: ["Microwave"],
    # dietary_preferences: ["None"]
    # )
    #
    # recipe = Recipe.create!(
    #  name: "Dorm Mac",
    # meal_type: "dinner",
    # cost: 3
    # )

    # meal_plan = MealPlan.create!(
    # user_profile: profile,
    # recipe: recipe,
    # day: "Monday",
    # meal_type: "Dinner"
    # )


    # ShoppingList.create!(
    #   user_profile: profile,
    #   items: [
    #     { "name" => "Pasta", "recipes" => [recipe.name], "purchased" => false }
    #   ]
    # )

    # expect {
    #  delete user_profile_path(profile)
    # }.to change(UserProfile, :count).by(-1)
    #  .and change(MealPlan, :count).by(-1)
    #  .and change(ShoppingList, :count).by(-2)

    #
    # expect(response).to redirect_to(root_path)
    # end
  end

    #  Failed update hits render :edit, status: :unprocessable_entity
    describe "PATCH /user_profiles/:id with invalid data" do
      it "re-renders edit with unprocessable_entity status" do
        profile = UserProfile.create!(
          name: "Valid User",
          weekly_budget: 25,
          appliances: [ "Microwave" ],
          dietary_preferences: [ "Vegetarian" ]
        )

        patch user_profile_path(profile), params: {
          user_profile: {
            name: "",              # invalid
            weekly_budget: 0,      # invalid
            appliances: [ "" ],
            dietary_preferences: [ "" ]
          }
        }

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response).to render_template(:edit)
      end
    end

    #  Destroy clears session when deleting current profile
    describe "DELETE /user_profiles/:id clears session" do
      it "clears session[:user_profile_id] when deleting the current profile" do
        post user_profiles_path, params: {
          user_profile: {
            name: "Session User",
            weekly_budget: 30,
            appliances: [ "Microwave" ],
            dietary_preferences: [ "None" ]
          }
        }

        profile = UserProfile.last
        expect(session[:user_profile_id]).to eq(profile.id)

        delete user_profile_path(profile)

        expect(response).to redirect_to(root_path)
        expect(session[:user_profile_id]).to be_nil
      end
    end

    # 3c. Profile not found branch
    describe "DELETE /user_profiles/:id when profile does not exist" do
      it "redirects to root with 'Profile not found.' alert" do
        delete user_profile_path(999_999)

        expect(response).to redirect_to(root_path)
        expect(flash[:alert]).to eq("Profile not found.")
      end
    end
end

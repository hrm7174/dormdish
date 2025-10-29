# frozen_string_literal: true

require "rails_helper"

RSpec.describe "MealPlans", type: :request do
  describe "GET /meal_plans" do
    it "renders the index successfully" do
      # View uses current_profile.weekly_budget
      profile = double("Profile", weekly_budget: 0)
      allow_any_instance_of(ApplicationController)
        .to receive(:current_profile).and_return(profile)

      get meal_plans_path
      expect(response).to have_http_status(:ok)
    end
  end
end

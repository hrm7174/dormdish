# spec/models/user_profile_spec.rb
require "rails_helper"

RSpec.describe UserProfile, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:weekly_budget) }

    it "is invalid when weekly_budget <= 0" do
      profile = described_class.new(
        name: "Heidy",
        weekly_budget: 0,
        appliances: [ "Microwave" ],
        dietary_preferences: [ "Vegetarian" ]
      )
      expect(profile).not_to be_valid
    end

    it "is valid with name, weekly_budget > 0, appliances, and dietary prefs" do
      profile = described_class.new(
        name: "Heidy",
        weekly_budget: 25,
        appliances: [ "Microwave" ],
        dietary_preferences: [ "Vegetarian" ]
      )
      expect(profile).to be_valid
    end
  end

  describe "associations" do
    it { is_expected.to have_many(:meal_plans).dependent(:destroy) }
    it { is_expected.to have_many(:recipes).through(:meal_plans) }
  end

  describe "appliance and dietary preference validations" do
    def build_profile(attrs = {})
      described_class.new(
        {
          name: "Heidy",
          weekly_budget: 25,
          appliances: [ "Microwave" ],
          dietary_preferences: [ "Vegetarian" ]
        }.merge(attrs)
      )
    end

    it "is invalid when no appliances are selected" do
      profile = build_profile(appliances: [])
      expect(profile).not_to be_valid
    end

    it "is invalid when appliances only contains empty strings" do
      profile = build_profile(appliances: [ "", " " ])
      expect(profile).not_to be_valid
    end

    it "is valid when appliances are selected" do
      profile = build_profile(appliances: [ "Microwave" ])
      expect(profile).to be_valid
    end

    it "is invalid when no dietary preferences are selected" do
      profile = build_profile(dietary_preferences: [])
      expect(profile).not_to be_valid
    end

    it "is invalid when dietary preferences only contains empty strings" do
      profile = build_profile(dietary_preferences: [ "", " " ])
      expect(profile).not_to be_valid
    end

    it "is valid when dietary preferences are selected" do
      profile = build_profile(dietary_preferences: [ "Vegetarian" ])
      expect(profile).to be_valid
    end

    it "is valid when 'None' is selected for dietary preferences" do
      profile = build_profile(dietary_preferences: [ "None" ])
      expect(profile).to be_valid
    end
  end
end

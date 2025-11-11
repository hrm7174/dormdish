# frozen_string_literal: true

require "rails_helper"

RSpec.describe UserProfile, type: :model do
  # Presence
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:weekly_budget) }

  # Numeric > 0
  it "is invalid when weekly_budget <= 0" do
    p0 = described_class.new(name: "Heidy", weekly_budget: 0)
    pm = described_class.new(name: "Heidy", weekly_budget: -5)

    expect(p0).to be_invalid
    expect(pm).to be_invalid
    expect(p0.errors[:weekly_budget]).to be_present
    expect(pm.errors[:weekly_budget]).to be_present
  end

  it "is valid with name and weekly_budget > 0" do
    expect(described_class.new(name: "Heidy", weekly_budget: 25)).to be_valid
  end

  # validation steps
  describe "appliance and dietary preference validations" do
    it "is invalid when no appliances are selected" do
      profile = UserProfile.new(name: "Heidy", weekly_budget: 25, appliances: [])
      expect(profile).to be_invalid
      expect(profile.errors[:appliances]).to include("must select at least one appliance")
    end

    it "is invalid when appliances only contains empty strings" do
      profile = UserProfile.new(name: "Heidy", weekly_budget: 25, appliances: [ "" ])
      expect(profile).to be_invalid
      expect(profile.errors[:appliances]).to include("must select at least one appliance")
    end

    it "is valid when appliances are selected" do
      profile = UserProfile.new(name: "Heidy", weekly_budget: 25, appliances: [ "Microwave" ])
      expect(profile).to be_valid
    end

    it "is invalid when no dietary preferences are selected" do
      profile = UserProfile.new(name: "Heidy", weekly_budget: 25, dietary_preferences: [])
      expect(profile).to be_invalid
      expect(profile.errors[:dietary_preferences]).to include("must select at least one dietary preference")
    end

    it "is invalid when dietary preferences only contains empty strings" do
      profile = UserProfile.new(name: "Heidy", weekly_budget: 25, dietary_preferences: [ "" ])
      expect(profile).to be_invalid
      expect(profile.errors[:dietary_preferences]).to include("must select at least one dietary preference")
    end

    it "is valid when dietary preferences are selected" do
      profile = UserProfile.new(name: "Heidy", weekly_budget: 25, dietary_preferences: [ "Vegetarian" ])
      expect(profile).to be_valid
    end

    it "is valid when 'None' is selected for dietary preferences" do
      profile = UserProfile.new(name: "Heidy", weekly_budget: 25, dietary_preferences: [ "None" ])
      expect(profile).to be_valid
    end
  end

  # === Associations ===
  it { is_expected.to have_many(:meal_plans).dependent(:destroy) }
  it { is_expected.to have_many(:recipes).through(:meal_plans) }
end

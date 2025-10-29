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
end

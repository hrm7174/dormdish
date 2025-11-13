# spec/models/recipe_spec.rb
require "rails_helper"

RSpec.describe Recipe, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:meal_type) }
    it { is_expected.to validate_presence_of(:cost) }
    it { is_expected.to validate_numericality_of(:cost).is_greater_than_or_equal_to(0) }
  end

  describe "associations" do
    it { is_expected.to have_many(:meal_plans).dependent(:destroy) }
    it { is_expected.to have_many(:user_profiles).through(:meal_plans) }
  end

  describe "#ingredients_list" do
    it "returns an empty array when ingredients is blank" do
      recipe = described_class.new(ingredients: nil)
      expect(recipe.ingredients_list).to eq([])
    end

    it "splits a comma-separated string into trimmed items" do
      recipe = described_class.new(ingredients: "Oats,  Milk ,  Honey  ,")
      expect(recipe.ingredients_list).to eq(%w[Oats Milk Honey])
    end
  end
end

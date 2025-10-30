# frozen_string_literal: true

require "rails_helper"

RSpec.describe Recipe, type: :model do
  it "is invalid without a name" do
    recipe = Recipe.new(meal_type: "dinner", cost: 5.0)
    expect(recipe).not_to be_valid
    expect(recipe.errors[:name]).to be_present
  end

  it "is invalid if cost is negative" do
    recipe = Recipe.new(name: "Broken Recipe", meal_type: "dinner", cost: -1)
    expect(recipe).not_to be_valid
    expect(recipe.errors[:cost]).to be_present
  end

  it "is valid with a name, meal_type, and nonnegative cost" do
    recipe = Recipe.new(name: "Good Recipe", meal_type: "dinner", cost: 3.5)
    expect(recipe).to be_valid
  end
end

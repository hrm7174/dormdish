# spec/models/shopping_list_spec.rb
require "rails_helper"

RSpec.describe ShoppingList, type: :model do
  describe "#items_purchased_count" do
    it "counts only purchased items" do
      list = described_class.new(
        items: [
          { "name" => "Milk",  "purchased" => true  },
          { "name" => "Eggs",  "purchased" => false },
          { "name" => "Bread", "purchased" => true  }
        ]
      )

      expect(list.items_purchased_count).to eq(2)
    end
  end

  describe "#items_for_recipe" do
    let!(:recipe) do
      Recipe.create!(
        name: "Dorm Mac",
        meal_type: "dinner",
        cost: 3
      )
    end

    it "returns items linked to the given recipe name" do
      list = described_class.new(
        items: [
          { "name" => "Pasta", "recipes" => ["Dorm Mac"] },
          { "name" => "Sauce", "recipes" => ["Other Recipe"] }
        ]
      )

      result = list.items_for_recipe(recipe.id)

      expect(result.map { |i| i["name"] }).to eq(["Pasta"])
    end

    it "returns an empty array when recipe is not found" do
      list = described_class.new(
        items: [
          { "name" => "Pasta", "recipes" => ["Dorm Mac"] }
        ]
      )

      expect(list.items_for_recipe(-1)).to eq([])
    end
  end

  describe "#remove_ingredient" do
    it "removes the ingredient with the given name and saves" do
      list = described_class.new(
        items: [
          { "name" => "Milk" },
          { "name" => "Eggs" }
        ]
      )

      # avoid hitting validations / DB, just confirm it calls save
      allow(list).to receive(:save).and_return(true)

      list.remove_ingredient("Milk")

      expect(list.items.map { |i| i["name"] }).to eq(["Eggs"])
      expect(list).to have_received(:save)
    end
  end
end

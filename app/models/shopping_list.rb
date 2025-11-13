
class ShoppingList < ApplicationRecord
  belongs_to :user_profile
  belongs_to :meal_plan, optional: true



    def generate_items
    ingredient_map = {}


    recipes = user_profile.meal_plans.includes(:recipe).map(&:recipe).compact

    recipes.each do |recipe|
      next if recipe.ingredients.blank?

      recipe.ingredients_list.each do |ingredient|
        ingredient_map[ingredient] ||= { "name" => ingredient, "recipes" => [] }
        ingredient_map[ingredient]["recipes"] << recipe.name unless ingredient_map[ingredient]["recipes"].include?(recipe.name)
      end
    end


    self.items = ingredient_map.values
    save!
  end


  def items_for_recipe(recipe_id)
    recipe = Recipe.find_by(id: recipe_id)
    return [] unless recipe
    items.select { |i| i["recipes"].include?(recipe.name) } rescue []
  end

  def remove_ingredient(name)
    self.items.reject! { |i| i["name"] == name }
    save
  end

  def items_purchased_count
    return 0 unless items.present?

    items.count do |item|
      # support both string and symbol keys, and booleans
      item["purchased"] || item[:purchased]
    end
  end
end

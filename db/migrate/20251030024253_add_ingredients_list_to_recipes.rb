class AddIngredientsListToRecipes < ActiveRecord::Migration[8.1]
  def change
    add_column :recipes, :ingredients_list, :text
  end
end

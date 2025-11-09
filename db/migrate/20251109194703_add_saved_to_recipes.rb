class AddSavedToRecipes < ActiveRecord::Migration[8.1]
  def change
    add_column :recipes, :saved, :boolean, default: false
    add_column :recipes, :user_profile_id, :integer
    add_index :recipes, :user_profile_id
  end
end

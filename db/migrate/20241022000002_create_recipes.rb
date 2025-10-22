class CreateRecipes < ActiveRecord::Migration[7.2]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :meal_type
      t.integer :prep_time
      t.float :cost
      t.text :ingredients
      t.text :appliances_needed, array: true, default: []
      t.text :dietary_tags, array: true, default: []
      t.timestamps
    end
  end
end

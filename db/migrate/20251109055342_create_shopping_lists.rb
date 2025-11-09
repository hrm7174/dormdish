class CreateShoppingLists < ActiveRecord::Migration[8.1]
  def change
    create_table :shopping_lists do |t|
      t.references :user_profile, null: false, foreign_key: true
      t.references :meal_plan, null: true, foreign_key: true
      t.json :items, default: []
      t.date :week_start

      t.timestamps
    end
  end
end

class CreateMealPlans < ActiveRecord::Migration[7.2]
  def change
    create_table :meal_plans do |t|
      t.references :user_profile, null: false, foreign_key: true
      t.references :recipe, null: false, foreign_key: true
      t.timestamps
    end
  end
end

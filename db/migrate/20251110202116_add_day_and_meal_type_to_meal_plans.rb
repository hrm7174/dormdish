class AddDayAndMealTypeToMealPlans < ActiveRecord::Migration[8.1]
  def change
    add_column :meal_plans, :day, :string
    add_column :meal_plans, :meal_type, :string
  end
end

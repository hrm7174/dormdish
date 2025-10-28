class MealPlansController < ApplicationController
  def index
    @meal_plans = MealPlan.all
    @weekly_total = @meal_plans.joins(:recipe).sum('recipes.cost')


    @meal_types = ['breakfast', 'lunch', 'dinner']
    @days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
  end
end

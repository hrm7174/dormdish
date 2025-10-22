class MealPlansController < ApplicationController
  def index
    @meal_plans = MealPlan.all
  end
end

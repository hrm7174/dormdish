
class MealPlansController < ApplicationController
  before_action :set_user_profile

  
  DAY_ORDER = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
  MEAL_ORDER = ["Breakfast", "Lunch", "Dinner", "Snack"]

  def index
   
    @meal_plans = @user_profile.meal_plans.includes(:recipe)

    
    @meal_plans = @meal_plans.sort_by do |mp|
      [
        DAY_ORDER.index(mp.day),
        MEAL_ORDER.index(mp.meal_type.capitalize)
      ]
    end

    @weekly_total = @meal_plans.sum { |mp| mp.recipe.cost }

    @meal_types = ["Breakfast", "Lunch", "Dinner", "Snack"]
    @days = DAY_ORDER
  end

  def create
    @meal_plan = @user_profile.meal_plans.new(
      recipe_id: params[:recipe_id],
      day: params[:day],
      meal_type: params[:meal_type]
    )

    if @meal_plan.save
      redirect_to meal_plans_path, notice: "Meal added to plan!"
    else
      redirect_back fallback_location: recipes_path, alert: "Could not add meal."
    end
  end

  def destroy
    @meal_plan = MealPlan.find(params[:id])
    @meal_plan.destroy
    redirect_to meal_plans_path, notice: "Meal removed from plan."
  end

  private

  def set_user_profile
    @user_profile = UserProfile.first
  end
end



class ShoppingListsController < ApplicationController
  before_action :check_meal_plan_not_empty, only: [ :index ]

  def show
    @shopping_list = ShoppingList.find(params[:id])
    @items = @shopping_list.respond_to?(:items) ? (@shopping_list.items || []) : []
  end

  def index
    # If we get here, meal plan has recipes
    @shopping_lists = current_profile.shopping_lists
  end

  def check_meal_plan
    if current_profile.meal_plans.empty?
      render :empty_meal_plan
    else
      redirect_to shopping_lists_path, notice: "Shopping list would be generated here!"
    end
  end

  def empty_meal_plan
    # rendering the view
  end

  private

  def check_meal_plan_not_empty
    if current_profile.meal_plans.empty?
      redirect_to meal_plans_path,
                  alert: "Please add at least one meal to your meal plan before generating a shopping list."
    end
  end
end

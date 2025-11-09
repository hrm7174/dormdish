class ShoppingListsController < ApplicationController
  def show
    @shopping_list = ShoppingList.find(params[:id])
    @items = @shopping_list.respond_to?(:items) ? (@shopping_list.items || []) : []
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

  def index
    @shopping_lists = current_profile.shopping_lists
  end
end


class ShoppingListsController < ApplicationController
  before_action :check_meal_plan_not_empty, only: [:index]


  def index
  
    @shopping_list = current_profile.shopping_lists.last || current_profile.shopping_lists.create

  
   if params[:refresh].present? || @shopping_list.items.blank?
    @shopping_list.generate_items
   end

 
    @recipes = current_profile.meal_plans.includes(:recipe).map(&:recipe).uniq


    @items = @shopping_list.items || []

    if params[:recipe_id].present?
      @selected_recipe = Recipe.find_by(id: params[:recipe_id])
      @items = @shopping_list.items_for_recipe(@selected_recipe.id) if @selected_recipe
    else
      @selected_recipe = nil
    end
  end


  def show
      @shopping_list = ShoppingList.find(params[:id])
      @items = @shopping_list.items || []
  end


  def destroy_item
    @shopping_list = ShoppingList.find(params[:id])
    ingredient_name = params[:ingredient_name]

    if @shopping_list.items.present?
      @shopping_list.items = @shopping_list.items.reject { |i| i["name"] == ingredient_name }
      @shopping_list.save!
    end

    redirect_to shopping_lists_path, notice: "#{ingredient_name} removed from shopping list."
  end

  private

  def set_shopping_list
    @shopping_list = ShoppingList.find(params[:shopping_list_id])
  end

  def check_meal_plan_not_empty
    if current_profile.meal_plans.empty?
      redirect_to meal_plans_path, alert: "Please add at least one meal to your meal plan before generating a shopping list."
    end
  end
end

class ShoppingListsController < ApplicationController
  def show
    @shopping_list = ShoppingList.find(params[:id])
    @items = @shopping_list.respond_to?(:items) ? (@shopping_list.items || []) : []
  end

  def index
    @shopping_lists = current_profile.shopping_lists
  end
end

class ShoppingListsController < ApplicationController
  def show
    @shopping_list = ShoppingList.find(params[:id])
  end

  def index
    @shopping_lists = current_profile.shopping_lists
  end
end

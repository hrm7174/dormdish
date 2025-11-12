

class MealPlan < ApplicationRecord
  belongs_to :user_profile
  belongs_to :recipe

  after_commit :update_shopping_list, on: [:create, :destroy]

  private

  def update_shopping_list
    
    shopping_list = user_profile.shopping_lists.last || user_profile.shopping_lists.create

   
    shopping_list.generate_items
  end
end

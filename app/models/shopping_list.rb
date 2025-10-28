class ShoppingList < ApplicationRecord
  belongs_to :meal_plan
  belongs_to :user_profile

  def items_purchased_count
    items.count { |item| item[:purchased] }
  end
end

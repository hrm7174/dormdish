class ShoppingList < ApplicationRecord
  belongs_to :meal_plan

  def items_purchased_count
    items.count { |item| item[:purchased] }
  end
end
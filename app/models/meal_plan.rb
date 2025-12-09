class MealPlan < ApplicationRecord
  belongs_to :user_profile
  belongs_to :recipe

  after_commit :update_shopping_list, on: [ :create, :destroy ], if: :should_update_shopping_list?

  private

  def should_update_shopping_list?
    user_profile.present? && user_profile.persisted? && !user_profile.destroyed?
  end

  def update_shopping_list
    return unless user_profile&.persisted?

    shopping_list = user_profile.shopping_lists.last || user_profile.shopping_lists.create
    shopping_list.generate_items
  end
end

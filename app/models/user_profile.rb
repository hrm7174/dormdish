class UserProfile < ApplicationRecord
  validates :name, :weekly_budget, presence: true
  validates :weekly_budget, numericality: { greater_than: 0 }
  validate :at_least_one_appliance, :at_least_one_dietary_preference

  has_many :meal_plans, dependent: :destroy
  has_many :recipes, through: :meal_plans
  has_many :shopping_lists, dependent: :destroy

  def at_least_one_appliance
    if appliances.blank? || appliances.all?(&:blank?)
      errors.add(:base, "Must select at least one appliance")
    end
  end

  def at_least_one_dietary_preference
    if dietary_preferences.blank? || dietary_preferences.all?(&:blank?)
      errors.add(:base, "Must select at least one dietary preference")
    end
  end
end

class Recipe < ApplicationRecord
  validates :name, :meal_type, :cost, presence: true
  validates :cost, numericality: { greater_than_or_equal_to: 0 }

  has_many :meal_plans, dependent: :destroy
  has_many :user_profiles, through: :meal_plans
end
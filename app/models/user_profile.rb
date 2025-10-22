class UserProfile < ApplicationRecord
  validates :name, :weekly_budget, presence: true
  validates :weekly_budget, numericality: { greater_than: 0 }

  has_many :meal_plans, dependent: :destroy
  has_many :recipes, through: :meal_plans

end

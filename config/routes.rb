Rails.application.routes.draw do
  root "pages#home"
  resources :user_profiles, only: [:new, :create, :show]
  resources :recipes, only: [:index, :show]
  resources :meal_plans, only: [:index]
  resources :shopping_lists, only: [:show]
end
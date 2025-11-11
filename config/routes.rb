Rails.application.routes.draw do
  root "pages#home"
  resources :user_profiles, only: [ :new, :create, :show, :edit, :update, :destroy ]
  resources :recipes, only: [ :index, :show, :new, :create]
  resources :meal_plans, only: [:index, :create, :destroy]
  resources :shopping_lists, only: [ :index, :show ] do
    collection do
      get "empty_meal_plan"
      get "check_meal_plan"
    end
  end
end

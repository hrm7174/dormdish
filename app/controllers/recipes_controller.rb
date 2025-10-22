class RecipesController < ApplicationController
  def index
    @user_profile = UserProfile.find_by(id: session[:user_profile_id])
    @recipes = Recipe.all

    if @user_profile
      @recipes = @recipes.select do |r|
        (r.appliances_needed - @user_profile.appliances).empty? &&
          (r.dietary_tags & @user_profile.dietary_preferences).any?
      end
    end

    @recipes = @recipes.select { |r| r.meal_type == params[:meal_type] } if params[:meal_type].present?
    @recipes = @recipes.select { |r| r.cost <= params[:max_cost].to_f } if params[:max_cost].present?
    @recipes = @recipes.select { |r| r.name.downcase.include?(params[:search].downcase) } if params[:search].present?
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
end
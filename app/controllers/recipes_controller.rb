
class RecipesController < ApplicationController
  def index
    @user_profile = UserProfile.find_by(id: session[:user_profile_id])
    @recipes = Recipe.all

    if @user_profile
      user_appliances = @user_profile.appliances.reject(&:blank?)
      user_dietary_preferences = @user_profile.dietary_preferences.reject(&:blank?)

      @recipes = @recipes.select do |recipe|
        appliances_compatible = if user_appliances.include?("None")
          recipe.appliances_needed.empty?
        else
          (recipe.appliances_needed - user_appliances).empty?
        end

        dietary_compatible = if user_dietary_preferences.include?("None")
          true
        else
          recipe.dietary_tags.empty? || (recipe.dietary_tags & user_dietary_preferences).any?
        end

        appliances_compatible && dietary_compatible
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

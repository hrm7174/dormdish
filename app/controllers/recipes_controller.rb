
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

    if params[:meal_type].present?
      search_meal_type = params[:meal_type].strip.downcase
      @recipes = @recipes.select { |r| r.meal_type.to_s.strip.downcase == search_meal_type }
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)


    if params[:recipe][:ingredients].present?
      @recipe.ingredients = params[:recipe][:ingredients].split(/\r?\n/).map(&:strip).reject(&:blank?).join(", ")
    end


    if params[:recipe][:dietary_tags].present?
      @recipe.dietary_tags = params[:recipe][:dietary_tags].reject(&:blank?)
    end

    if params[:recipe][:appliances_needed].present?
      @recipe.appliances_needed = params[:recipe][:appliances_needed].reject(&:blank?)
    end

    if @recipe.save
      redirect_to @recipe, notice: "Recipe created successfully!"
    else
      flash.now[:alert] = "Could not create recipe."
      render :new, status: :unprocessable_entity
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(
      :name,
      :meal_type,
      :prep_time,
      :cost,
      :ingredients,
      :instructions,
      :appliances_needed,
      :dietary_tags
    )
  end
end

# spec/controllers/shopping_lists_controller_spec.rb
require "rails_helper"

RSpec.describe ShoppingListsController, type: :controller do
  let!(:profile) do
    UserProfile.create!(
      name: "Alex",
      weekly_budget: 30,
      appliances: [ "Microwave" ],
      dietary_preferences: [ "None" ]
    )
  end

  let!(:recipe) do
    Recipe.create!(
      name: "Dorm Mac",
      meal_type: "dinner",
      cost: 3
    )
  end

  let!(:meal_plan) do
    MealPlan.create!(
      user_profile: profile,
      recipe: recipe,
      day: "Monday",
      meal_type: "Dinner"
    )
  end

  before do
    allow_any_instance_of(ApplicationController)
      .to receive(:current_profile)
      .and_return(profile)
  end

  describe "GET #index with refresh and recipe filter" do
    it "calls generate_items and filters items for the selected recipe" do
      shopping_list = profile.shopping_lists.create!(
        items: [
          { "name" => "Pasta", "recipes" => [ "Dorm Mac" ] },
          { "name" => "Sauce", "recipes" => [ "Other" ] }
        ]
      )

      # we just want to exercise the branch; don't care about internals here
      expect_any_instance_of(ShoppingList).to receive(:generate_items)

      get :index, params: { refresh: "1", recipe_id: recipe.id }

      expect(response).to be_successful
      expect(assigns(:shopping_list)).to eq(shopping_list)
      expect(assigns(:selected_recipe)).to eq(recipe)
      # items_for_recipe branch should have run
      expect(assigns(:items).map { |i| i["name"] }).to eq([ "Pasta" ])
    end
  end

  describe "GET #show" do
    it "assigns @shopping_list and @items" do
      shopping_list = profile.shopping_lists.create!(
        items: [ { "name" => "Milk" } ]
      )

      get :show, params: { id: shopping_list.id }

      expect(response).to be_successful
      expect(assigns(:shopping_list)).to eq(shopping_list)
      expect(assigns(:items)).to eq(shopping_list.items)
    end
  end

  describe "DELETE #destroy_item" do
    it "removes an ingredient and redirects with a notice" do
      shopping_list = profile.shopping_lists.create!(
        items: [
          { "name" => "Milk" },
          { "name" => "Eggs" }
        ]
      )

      delete :destroy_item, params: { id: shopping_list.id, ingredient_name: "Milk" }

      expect(response).to redirect_to(shopping_lists_path)
      expect(flash[:notice]).to include("Milk removed from shopping list")
      shopping_list.reload
      expect(shopping_list.items.map { |i| i["name"] }).to eq([ "Eggs" ])
    end
  end

  describe "#set_shopping_list (private)" do
    it "finds the shopping list by shopping_list_id" do
      shopping_list = profile.shopping_lists.create!(items: [])

      controller.params[:shopping_list_id] = shopping_list.id
      controller.send(:set_shopping_list)

      expect(controller.instance_variable_get(:@shopping_list)).to eq(shopping_list)
    end
  end
end

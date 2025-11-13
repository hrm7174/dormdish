# spec/controllers/recipes_controller_spec.rb
require "rails_helper"

RSpec.describe RecipesController, type: :controller do
  describe "GET #index" do
    it "is successful" do
      get :index
      expect(response).to be_successful
    end

    it "filters compatible recipes based on profile appliances and diet" do
      profile = UserProfile.create!(
        name: "Heidy",
        weekly_budget: 25,
        appliances: [ "Microwave" ],
        dietary_preferences: [ "Vegetarian" ]
      )

      good_recipe = Recipe.create!(
        name: "Microwave Veggie Bowl",
        meal_type: "Dinner",
        prep_time: 10,
        cost: 5.0,
        appliances_needed: [ "Microwave" ],
        dietary_tags: [ "Vegetarian" ],
        ingredients: "Veggies, Rice"
      )

      bad_recipe = Recipe.create!(
        name: "Oven Chicken",
        meal_type: "Dinner",
        prep_time: 40,
        cost: 10.0,
        appliances_needed: [ "Oven" ],
        dietary_tags: [],
        ingredients: "Chicken"
      )

      session[:user_profile_id] = profile.id
      get :index

      expect(assigns(:recipes)).to include(good_recipe)
      expect(assigns(:recipes)).not_to include(bad_recipe)
    end

    it "applies meal_type, max_cost, and search filters" do
      profile = UserProfile.create!(
        name: "Filter User",
        weekly_budget: 50,
        appliances: [ "Microwave" ],
        dietary_preferences: [ "Vegetarian" ]
      )

      match_recipe = Recipe.create!(
        name: "Overnight Oats",
        meal_type: "Breakfast",
        prep_time: 5,
        cost: 3.0,
        appliances_needed: [],
        dietary_tags: [ "Vegetarian" ],
        ingredients: "Oats, Milk, Honey"
      )

      other_meal_recipe = Recipe.create!(
        name: "Breakfast Burrito",
        meal_type: "Breakfast",
        prep_time: 8,
        cost: 7.0,
        appliances_needed: [ "Microwave" ],
        dietary_tags: [],
        ingredients: "Eggs, Tortilla"
      )

      other_type_recipe = Recipe.create!(
        name: "Overnight Pasta",
        meal_type: "Dinner",
        prep_time: 20,
        cost: 4.0,
        appliances_needed: [],
        dietary_tags: [ "Vegetarian" ],
        ingredients: "Pasta, Sauce"
      )

      session[:user_profile_id] = profile.id

      get :index, params: {
        meal_type: "Breakfast",
        max_cost: 5,
        search: "overnight"
      }

      recipes = assigns(:recipes)
      expect(recipes).to match_array([ match_recipe ])
    end
  end
    describe "GET #index with profile filters" do
    let!(:plain_recipe) do
      Recipe.create!(
        name: "Plain Pasta",
        meal_type: "dinner",
        cost: 3,
        appliances_needed: [],
        dietary_tags: []
      )
    end

    let!(:microwave_recipe) do
      Recipe.create!(
        name: "Microwave Burrito",
        meal_type: "dinner",
        cost: 4,
        appliances_needed: [ "Microwave" ],
        dietary_tags: [ "Vegetarian" ]
      )
    end

    it "treats 'None' appliances and dietary prefs correctly" do
      profile = UserProfile.create!(
        name: "Alex",
        weekly_budget: 30,
        appliances: [ "None" ],          # triggers appliances_needed.empty? branch
        dietary_preferences: [ "None" ]  # triggers `true` branch for dietary_compatible
      )

      get :index, params: {}, session: { user_profile_id: profile.id }

      # Only recipes with no appliances needed should be returned
      expect(assigns(:recipes)).to match_array([ plain_recipe ])
    end
  end

  describe "GET #index without a profile" do
    it "returns all recipes without filtering" do
      r1 = Recipe.create!(name: "Mac", meal_type: "dinner", cost: 2)
      r2 = Recipe.create!(name: "Oats", meal_type: "breakfast", cost: 1)

      get :index  # no session[:user_profile_id]

      expect(assigns(:recipes)).to match_array([ r1, r2 ])
    end
  end

  describe "GET #index filter combinations" do
    let!(:cheap_breakfast) do
      Recipe.create!(name: "Overnight Oats", meal_type: "breakfast", cost: 2)
    end

    let!(:expensive_breakfast) do
      Recipe.create!(name: "Fancy Oats", meal_type: "breakfast", cost: 10)
    end

    let!(:cheap_dinner) do
      Recipe.create!(name: "Cheap Mac", meal_type: "dinner", cost: 3)
    end

    it "applies meal_type, max_cost and search filters together" do
      get :index, params: { meal_type: "breakfast", max_cost: "5", search: "oats" }

      expect(assigns(:recipes)).to eq([ cheap_breakfast ])
    end
  end

  describe "GET #show" do
    it "renders a single recipe" do
      recipe = Recipe.create!(name: "Mac", meal_type: "dinner", cost: 2)

      get :show, params: { id: recipe.id }

      expect(response).to be_successful
      expect(assigns(:recipe)).to eq(recipe)
    end
  end

  describe "GET #new" do
    it "assigns a new recipe" do
      get :new

      expect(response).to be_successful
      expect(assigns(:recipe)).to be_a_new(Recipe)
    end
  end

  describe "POST #create" do
    let(:valid_params) do
      {
        recipe: {
          name: "Form Recipe",
          meal_type: "dinner",
          prep_time: 10,
          cost: 4.5,
          ingredients: "pasta\ncheese\nmilk",
          appliances_needed: "Microwave, Hot Plate",
          dietary_tags: "Vegetarian, High Protein"
        }
      }
    end

    it "creates a recipe and redirects on success, transforming fields" do
      expect {
        post :create, params: valid_params
      }.to change(Recipe, :count).by(1)

      recipe = Recipe.last
      expect(response).to redirect_to(recipe_path(recipe))

      # ingredients joined with commas
      expect(recipe.ingredients).to eq("pasta, cheese, milk")
      # arrays split & cleaned
      expect(recipe.appliances_needed).to match_array([ "Microwave", "Hot Plate" ])
      expect(recipe.dietary_tags).to match_array([ "Vegetarian", "High Protein" ])
    end

    it "re-renders new with errors when invalid" do
      invalid_params = {
        recipe: {
          name: "",                 # invalid
          meal_type: "dinner",
          prep_time: 10,
          cost: 4.5,
          ingredients: "",
          appliances_needed: "",
          dietary_tags: ""
        }
      }

      expect {
        post :create, params: invalid_params
      }.not_to change(Recipe, :count)

      expect(response).to have_http_status(:unprocessable_entity)
      expect(response).to render_template(:new)
      expect(flash[:alert]).to eq("Could not create recipe.")
    end
  end

  describe "GET #index with profile filters" do
  let!(:plain_recipe) do
    Recipe.create!(
      name: "Plain Pasta",
      meal_type: "dinner",
      cost: 3,
      appliances_needed: [],
      dietary_tags: []
    )
  end

  let!(:microwave_recipe) do
    Recipe.create!(
      name: "Microwave Burrito",
      meal_type: "dinner",
      cost: 4,
      appliances_needed: [ "Microwave" ],
      dietary_tags: [ "Vegetarian" ]
    )
  end

  it "treats 'None' appliances and dietary prefs correctly" do
    profile = UserProfile.create!(
      name: "Alex",
      weekly_budget: 30,
      appliances: [ "None" ],          # triggers appliances_needed.empty? branch
      dietary_preferences: [ "None" ]  # triggers `true` branch for dietary_compatible
    )

    get :index, params: {}, session: { user_profile_id: profile.id }

    # Only recipes with no appliances needed should be returned
    expect(assigns(:recipes)).to match_array([ plain_recipe ])
  end
end

describe "GET #index without a profile" do
  it "returns all recipes without filtering" do
    r1 = Recipe.create!(name: "Mac", meal_type: "dinner", cost: 2)
    r2 = Recipe.create!(name: "Oats", meal_type: "breakfast", cost: 1)

    get :index  # no session[:user_profile_id]

    expect(assigns(:recipes)).to match_array([ r1, r2 ])
  end
end

describe "GET #index filter combinations" do
  let!(:cheap_breakfast) do
    Recipe.create!(name: "Overnight Oats", meal_type: "breakfast", cost: 2)
  end

  let!(:expensive_breakfast) do
    Recipe.create!(name: "Fancy Oats", meal_type: "breakfast", cost: 10)
  end

  let!(:cheap_dinner) do
    Recipe.create!(name: "Cheap Mac", meal_type: "dinner", cost: 3)
  end

  it "applies meal_type, max_cost and search filters together" do
    get :index, params: { meal_type: "breakfast", max_cost: "5", search: "oats" }

    expect(assigns(:recipes)).to eq([ cheap_breakfast ])
  end
end

describe "GET #show" do
  it "renders a single recipe" do
    recipe = Recipe.create!(name: "Mac", meal_type: "dinner", cost: 2)

    get :show, params: { id: recipe.id }

    expect(response).to be_successful
    expect(assigns(:recipe)).to eq(recipe)
  end
end

describe "GET #new" do
  it "assigns a new recipe" do
    get :new

    expect(response).to be_successful
    expect(assigns(:recipe)).to be_a_new(Recipe)
  end
end

describe "POST #create" do
  let(:valid_params) do
    {
      recipe: {
        name: "Form Recipe",
        meal_type: "dinner",
        prep_time: 10,
        cost: 4.5,
        ingredients: "pasta\ncheese\nmilk",
        appliances_needed: "Microwave, Hot Plate",
        dietary_tags: "Vegetarian, High Protein"
      }
    }
  end

  it "creates a recipe and redirects on success, transforming fields" do
    expect {
      post :create, params: valid_params
    }.to change(Recipe, :count).by(1)

    recipe = Recipe.last
    expect(response).to redirect_to(recipe_path(recipe))

    # ingredients joined with commas
    expect(recipe.ingredients).to eq("pasta, cheese, milk")
    # arrays split & cleaned
    expect(recipe.appliances_needed).to match_array([ "Microwave", "Hot Plate" ])
    expect(recipe.dietary_tags).to match_array([ "Vegetarian", "High Protein" ])
  end

  it "re-renders new with errors when invalid" do
    invalid_params = {
      recipe: {
        name: "",                 # invalid
        meal_type: "dinner",
        prep_time: 10,
        cost: 4.5,
        ingredients: "",
        appliances_needed: "",
        dietary_tags: ""
      }
    }

    expect {
      post :create, params: invalid_params
    }.not_to change(Recipe, :count)

    expect(response).to have_http_status(:unprocessable_entity)
    expect(response).to render_template(:new)
    expect(flash[:alert]).to eq("Could not create recipe.")
  end
end
end

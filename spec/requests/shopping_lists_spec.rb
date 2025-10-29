# frozen_string_literal: true

require "rails_helper"

RSpec.describe "ShoppingLists", type: :request do
  describe "GET /shopping_lists" do
    it "renders the index successfully" do
      # Controller calls current_profile.shopping_lists
      profile = double("Profile", shopping_lists: [])
      allow_any_instance_of(ApplicationController)
        .to receive(:current_profile).and_return(profile)

      get shopping_lists_path
      expect(response).to have_http_status(:ok)
    end
  end

# spec/requests/shopping_lists_spec.rb
describe "GET /shopping_lists/:id" do
    it "renders the show successfully (stubbed class + find)" do
      # Replace AR model with a plain Ruby class that implements what the view/controller need.
      FakeShoppingList = Class.new do
        attr_reader :id
        def initialize(id: 1) = @id = id
        def items_purchased_count = 0
        def items = []
        # important: provide the class method Rails calls
        def self.find(_id) = new(id: 1)
      end

      stub_const("ShoppingList", FakeShoppingList)

      get shopping_list_path(id: 1)
      expect(response).to have_http_status(:ok)
    end
  end
end

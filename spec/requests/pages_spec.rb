# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Pages", type: :request do
  describe "GET /" do
    it "renders the home page successfully" do
      get root_path
      expect(response).to have_http_status(:ok)
      expect(response.body).to include("DormDish").or include("Get Started")
    end
  end
end

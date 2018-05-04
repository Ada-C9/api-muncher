require "test_helper"

describe RecipesController do
  describe "root_path" do
    it "loads root_path" do
      get root_path
      must_respond_with :success
    end
  end

  describe "index" do
    it "shows results from valid search" do
      VCR.use_cassette("recipes") do
        get results_path, params: {
          search: "pumpkin pie"
      }
      must_respond_with :success
      end
    end
  end

  describe "show" do
    it "returns the requested recipe" do
      VCR.use_cassette("recipes") do
      response = EdamamApiWrapper.get_recipes("pumpkin pie")
      a = response.first.id
      get recipe_path(a)
      must_respond_with :success
      end
    end

    it "redirects invalid request" do
      VCR.use_cassette("recipes") do
      response = EdamamApiWrapper.get_recipes("pumpkin pie")

      a = response.last.id.to_i + 1

      get recipe_path(a.to_s)
      must_respond_with :redirect
      must_redirect_to root_path
    end
    end
  end
end

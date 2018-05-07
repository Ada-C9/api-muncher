require "test_helper"

describe RecipesController do
  describe "search" do
    it "responds with success" do
      get root_path

      must_respond_with :success
    end
  end

  describe "index" do
    it "responds with success for real search" do
      VCR.use_cassette("recipes") do
        query = "chicken"
        get results_path, params: {query: query}
      end

      must_respond_with :success
    end

    it "responds with success for search with no results" do
      VCR.use_cassette("recipes") do
        query = "something that doesnt exist"
        get results_path, params: {query: query}
      end

      must_respond_with :success
    end
  end

  describe "show" do
    it "responds with success" do
      VCR.use_cassette("recipes") do
        id = "67b2867627c159e4f5bbaf2431b3ccb6"
        get recipe_path(id)
      end

      must_respond_with :success
    end
  end
end

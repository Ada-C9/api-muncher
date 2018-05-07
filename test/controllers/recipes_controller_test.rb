require "test_helper"

describe RecipesController do
  describe "search" do
    it "succeeds" do
      get root_path

      must_respond_with :success
    end
  end

  describe "index" do
    it "succeeds for a valid search query" do
      VCR.use_cassette('recipes') do
        get results_path, params: { query: "chicken"}

        must_respond_with :success
      end
    end

    it "redirects when no search query is entered" do
      VCR.use_cassette('recipes') do
        get results_path, params: { query: ""}

        must_respond_with :redirect
        must_redirect_to root_path
        flash[:message].must_equal "You must enter something to search. Please try again."
      end
    end

    it "redirects when search query is invalid" do
      VCR.use_cassette('recipes') do
        get results_path, params: { query: "qwerty"}

        must_respond_with :redirect
        must_redirect_to root_path
        flash[:message].must_equal "API called failed. No results found."
      end
    end
  end

  describe "show" do
    it "succeeds for a valid recipe" do
      VCR.use_cassette('recipe') do
        get recipe_path("7bf4a371c6884d809682a72808da7dc2")

        must_respond_with :success
      end
    end

    it "redirects when recipe id is invalid" do
      VCR.use_cassette('recipe') do
        get recipe_path("12345")

        must_respond_with :redirect
        must_redirect_to root_path
        flash[:message].must_equal "API called failed. No results found."
      end
    end
  end
end

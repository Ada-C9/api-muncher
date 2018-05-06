require "test_helper"

describe RecipesController do
  describe 'home' do
    it "succeeds" do
      get root_path

      must_respond_with :success
    end
  end

  describe 'index' do
    it "succeeds" do
      VCR.use_cassette('recipes') do

        get recipes_path, params: {query: "brains"}

        must_respond_with :success
      end
    end

    it "succeeds with illogical input" do
      VCR.use_cassette('recipes') do

        get recipes_path, params: {query: "qwerty"}

        must_respond_with :success
      end
    end

    it "flashes message with no query" do
      VCR.use_cassette('recipes') do

        get recipes_path, params: {query: ""}

        must_respond_with :success
        flash[:status].must_equal :failure
        flash[:message].must_equal "Please enter the name of a recipe."
      end
    end
  end

  describe 'show' do
    it "succeeds" do
      VCR.use_cassette('recipes') do
        recipes = EdamamWrapper.search_recipes("brains")
        recipe = recipes.first

        get recipe_path(recipe.id)
        must_respond_with :success
      end
    end

    it "fails with invalid recipe id" do
      VCR.use_cassette('recipes') do

        get recipe_path("0000")

        flash[:status].must_equal :failure
        flash[:message].must_equal "Unable to retrieve your recipe."
        must_respond_with :redirect
      end
    end
  end

end

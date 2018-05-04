require "test_helper"

describe RecipesController do
  describe 'index' do
    it "should get index" do
      VCR.use_cassette("recipes") do
        get recipes_path
        must_respond_with :success
      end
    end
  end

  describe "show" do
    it "should get show" do
      VCR.use_cassette("recipes") do
        recipe = EdamamApiWrapper.search_recipes("kale").first
        get recipe_path(recipe.uri_trim)
        must_respond_with :success
      end
    end

    it "should not show if the recipe is invalid" do
      VCR.use_cassette("recipes") do
        get recipe_path("xoxox")
        must_respond_with :redirect
      end
    end

  end

  describe "root" do
    it "should get root" do
      get root_path
      must_respond_with :success
    end
  end

end

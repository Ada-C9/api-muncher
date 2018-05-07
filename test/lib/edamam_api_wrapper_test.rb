require 'test_helper'

describe EdamamApiWrapper do

  describe "search_for" do

    it "Can search for existing food-item" do
      VCR.use_cassette("recipes") do
        response = EdamamApiWrapper.search_for("chicken")
        response.must_be_kind_of Array
      end
    end

    it "Can't search for non-existent food-item" do
      VCR.use_cassette("recipes") do
        response = EdamamApiWrapper.search_for("asfd")
        response.must_equal []
      end
    end

    it "Can't search for a blank" do
      VCR.use_cassette("recipes") do
        response = EdamamApiWrapper.search_for("asfd")
        response.must_equal []
      end
    end
  end

  describe "show_recipe" do
    it "can show a single recipe" do
      response = EdamamApiWrapper.search_for("chicken")
      recipe_uri = "7bf4a371c6884d809682a72808da7dc2"
      @recipe = EdamamApiWrapper.show_recipe(recipe_uri)
      @recipe.must_be_kind_of Recipe
    end
  end
end

require 'test_helper'

describe RecipeApiWrapper do

  describe "find_recipes" do
    it "returns array of recipes based on query/search terms" do
      VCR.use_cassette("recipes") do
        query = "pork"
        recipes_list = RecipeApiWrapper.find_recipes(query)
        recipes_list.must_be_kind_of Array
      end
    end

    it "Returns empty array if there are no query matches" do
      VCR.use_cassette("recipes2") do
        query = 2429384725434.229384687
        recipes_list = RecipeApiWrapper.find_recipes(query)
        recipes_list.must_be_empty
      end
    end
  end

  describe "get_recipe" do

    before do
      VCR.use_cassette("get_recipe") do
        RecipeApiWrapper.find_recipes("chicken")
        recipe_id = "7bf4a371c6884d809682a72808da7dc2"
        @recipe = RecipeApiWrapper.find_recipe(recipe_id)
      end
    end

    it "Can return an instance of Recipe" do
      VCR.use_cassette("show_recipe") do
        @recipe.must_be_kind_of Recipe
      end
    end

    it "returns the accurate information for a recipe" do
      VCR.use_cassette("show_recipe") do
        @recipe.name.must_equal "Teriyaki Chicken"
      end
    end

  end

end

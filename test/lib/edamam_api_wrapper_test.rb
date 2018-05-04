require 'test_helper'
require 'pry'

describe EdamamApiWrapper do

  describe "list_recipes" do
    it "Can return array of recipes based on query" do
      VCR.use_cassette("recipes") do
        query = "chicken"
        recipe_list = EdamamApiWrapper.list_recipes(query)
        recipe_list.must_be_kind_of Array
      end
    end

    it "Returns empty array if there are no query matches" do
      VCR.use_cassette("recipes2") do
        query = 24324234234234.2342432432
        recipe_list = EdamamApiWrapper.list_recipes(query)
        recipe_list.must_be_empty
      end
    end
  end

  describe "find_recipe" do

    before do
      VCR.use_cassette("show_recipe") do
        EdamamApiWrapper.list_recipes("chicken")
        recipe_id = "7bf4a371c6884d809682a72808da7dc2"
        @recipe = EdamamApiWrapper.find_recipe(recipe_id)
      end
    end
    it "Can return Recipe" do
      VCR.use_cassette("show_recipe") do
        @recipe.must_be_kind_of Recipe
      end
    end

    it "returns the accurate information of a recipe" do
      VCR.use_cassette("show_recipe") do
        @recipe.name.must_equal "Teriyaki Chicken"
        @recipe.image.must_equal "https://www.edamam.com/web-img/262/262b4353ca25074178ead2a07cdf7dc1.jpg"
        @recipe.must_respond_to :id
        @recipe.must_respond_to :name
      end
    end

  end

end

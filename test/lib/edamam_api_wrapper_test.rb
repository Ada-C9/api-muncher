require 'test_helper'

describe EdamamApiWrapper do

  describe "self.search_recipes" do
    it "can complete a search" do
      VCR.use_cassette("search_recipes") do
        search_recipes = "apple"
        results = EdamamApiWrapper.search_recipes(search_recipes)
        results.must_be_instance_of Array
        results.length.must_be :>, 0
        results.each do |result|
          result.must_be_instance_of Recipe
        end
      end
    end

    it "search with fake app_key will not work" do
      VCR.use_cassette("search_recipes") do
        search_recipes = "orange"
        results = EdamamApiWrapper.search_recipes(search_recipes, nil, "fake")
        results.must_be_instance_of Array
        results.length.must_equal 0
      end
    end

    it "search with fake app_key will not work" do
      VCR.use_cassette("search_recipes") do
        search_recipes = "bread"
        results = EdamamApiWrapper.search_recipes(search_recipes, "fake", nil)
        results.must_be_instance_of Array
        results.length.must_equal 0
      end
    end

    it "will redirect to home page if no search results" do
      VCR.use_cassette("search_recipes") do
        search_recipes = ""
        results = EdamamApiWrapper.search_recipes(search_recipes)
        results.must_be_instance_of Array
        results.must_equal []
      end
    end
  end

  describe "self.find_recipe" do
    it "find_recipe will return a specific recipe" do
      VCR.use_cassette("find_recipe") do
        uri = "http://www.edamam.com/ontologies/edamam.owl#recipe_7bf4a371c6884d809682a72808da7dc2"
        uri = URI.escape(uri)
        recipe = EdamamApiWrapper.find_recipe(uri)
        recipe.must_be_instance_of Recipe
        recipe.name.must_equal "Teriyaki Chicken"
      end
    end

  end
end

require 'test_helper'

describe "RecipeApiWrapper" do

  describe "search_recipes" do

    it "gives a list of recipes" do
      VCR.use_cassette("recipes") do
        query = "rabbit"
        recipes = RecipeSearchWrapper.search_recipes(query)

        recipes.each do |recipe|
          recipe.must_be_kind_of Recipe
        end
      end
    end
  end

  describe "find_recipe" do
    it "returns a recipe" do
      VCR.use_cassette("find") do
        rabbits = RecipeSearchWrapper.search_recipes("rabbit")
        recipe = rabbits.last

        rabbit_recipe = RecipeSearchWrapper.find_recipe(recipe.uri)

        rabbit_recipe.must_be_kind_of Recipe
      end
    end
  end


end

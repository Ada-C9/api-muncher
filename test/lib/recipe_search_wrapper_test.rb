require 'test_helper'

describe "RecipeApiWrapper" do

  describe "search_recipes" do

    it "gives a list of recipes" do
      VCR.use_cassette("recipes") do
        recipes = RecipeSearchWrapper.search_recipes

        recipes.each do |recipe|
          recipe.must_be_kind_of Recipe
        end
      end
    end

  end

  
end

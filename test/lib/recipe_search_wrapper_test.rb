require 'test_helper'

describe "RecipeApiWrapper" do

  describe "search_recipes" do

    it "gives a list of recipes" do
      VCR.use_cassette("recipes") do
        query = "chicken"
        recipes = RecipeSearchWrapper.search_recipes(query)

        recipes.each do |recipe|
          recipe.must_be_kind_of Recipe
        end
      end
    end

  end


end

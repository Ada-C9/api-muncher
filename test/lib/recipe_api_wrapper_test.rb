require 'test_helper'


describe RecipeApiWrapper do

  describe "list_recipes" do
    it "gives a list of recipes" do
      VCR.use_cassette("recipes") do
        recipes = RecipeApiWrapper.list_recipes("query")

        recipes.each do |recipe|
          recipe.must_be_kind_of Recipe
        end
      end
    end

    it "throws an error if the auth is bad" do
      skip "beyong our scope, don't worry about this for API Muncher"
      # Dan will give brownie points if we can figure this out

    end
  end
end

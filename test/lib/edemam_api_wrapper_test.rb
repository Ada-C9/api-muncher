require 'test_helper'

describe EdemamApiWrapper do
  describe "list_recipes" do
    it "gives a list of recipes for a flavor" do
      VCR.use_cassette("recipes") do
        flavor = "tofu"

        recipes = EdemamApiWrapper.list_recipes(flavor)
        recipes.each do |recipe|
          recipe.must_be_kind_of Recipe
        end
      end
    end
  end

  describe "find_recipe" do
    it "can find an individual recipe that exited" do
      VCR.use_cassette("recipes") do
        uri = "edb6a25bfb2aa0613ccb2c2f545b30a5"
        recipe = EdemamApiWrapper.find_recipe(uri)
      end
    end

    it "raise an error when you try to find a recipe DNE" do
      VCR.use_cassette("recipes") do
        uri = "edb6djdka343dad33a25bfb2aa0613ccb2c2f545b30a5"
        proc {
          EdemamApiWrapper.find_recipe(uri)
        }.must_raise ArgumentError
      end
    end
  end
end

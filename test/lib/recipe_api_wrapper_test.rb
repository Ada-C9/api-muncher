require 'test_helper'

require 'test_helper'

describe RecipeApiWrapper do
  describe 'list_recipes' do
    it 'gives a list of recipes' do

      VCR.use_cassette("recipes") do
        recipes = RecipeApiWrapper.list_recipes("chicken")

        recipes.each do |recipe|
          recipe.must_be_kind_of Recipe
        end
      end
    end

    it "can't give a list of recipes" do
      VCR.use_cassette("recipes") do
      recipe = RecipeApiWrapper.list_recipes("jdns2n")
      recipe.must_equal []

      end
    end
  end
end

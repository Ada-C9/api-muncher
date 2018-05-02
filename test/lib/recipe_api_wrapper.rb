require 'test_helper'

require 'test_helper'

describe RecipeApiWrapper do
  describe 'list_recipes' do
    it 'gives a list of recipes' do

      VCR.use_cassette("recipes") do
        recipes = RecipeApiWrapper.list_recipes

        recipes.each do |recipe|
          recipe.must_be_kind_of Recipe
        end
      end
    end

    it 'throws an error if the auth is bad' do
      skip 'beyond our scope, dont worry about this for API muncher'
    end
  end

  describe 'show_recipe' do
  end
end

require 'test_helper'

describe MuncherApiWrapper do
  describe 'get_recipes' do
    it 'must return a colleciton of recipes' do
      VCR.use_cassette('recipes') do
        recipes = MuncherApiWrapper.get_recipes('chicken')

        recipes.each do |recipe|
          recipe.must_be_instance_of Recipe
        end
      end
    end
  end # get_recipes

  describe 'get_one_recipe' do
    it 'must return a single recipe' do
      VCR.use_cassette('recipes') do
        recipe = MuncherApiWrapper.get_one_recipe(recipe_uri)

        recipe.must_be_instance_of Recipe
        recipe.name.must_equal recipe_name
        recipe.uri.must_equal recipe_uri
        recipe.ingredients.must_equal recipe_ingredients
        recipe.image.must_equal recipe_image
        recipe.dietary_info.must_equal dietary_info
      end
    end
  end # get one recipe
end # Muncher Api Wrapper

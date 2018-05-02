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
end # Muncher Api Wrapper
